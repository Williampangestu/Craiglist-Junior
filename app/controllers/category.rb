get '/categories' do
  @category = Category.all
  erb :"categories/index"
end

get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @article = @category.articles
  erb :"categories/show"
end

