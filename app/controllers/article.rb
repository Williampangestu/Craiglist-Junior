require 'faker'

get '/categories/:category_id/articles/new' do
  @category = Category.find(params[:category_id])

  erb :"articles/new"
end

get '/categories/:category_id/articles/:article_id' do
  @category = Category.find_by_id(params[:category_id])
  # @article = @category.articles.find_by_id(params[:article_id])  #same as below
  @article = Article.find_by_id(params[:article_id])

  erb :"articles/show"
end

get '/categories/:category_id/articles/:article_id/edit' do
  @category = Category.find_by_id(params[:category_id])
  # @article = @category.articles.find_by_id(params[:article_id])  #same as below
  @article = Article.find_by_id(params[:article_id])

  erb :"articles/edit"
end

post '/categories/:category_id/articles/new' do
  article = Article.create(title: params[:title],
                           description: params[:description],
                           email: params[:email],
                           price: params[:price],
                           key: Faker::Bitcoin.address[1..5],
                           category_id: params[:category_id]
                          )
  redirect "/categories/#{params[:category_id]}/articles/#{article.id}"
end


put '/categories/:category_id/articles/:article_id/edit' do
  article = Article.find_by_id(params[:article_id])
  article.update(title: params[:title],
                 description: params[:description],
                 email: params[:email],
                 price: params[:price],
                 category_id: params[:category_id]
                )
  redirect "/categories/#{params[:category_id]}/articles/#{article.id}"
end