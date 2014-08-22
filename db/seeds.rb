require 'faker'

module CategoryImporter
  def self.import
    5.times do
      Category.create(name: Faker::Commerce.department)
    end
  end
end

module ArticleImporter
  def self.import
    40.times do
      Article.create(title: Faker::Commerce.product_name,
                     description: Faker::Lorem.paragraph,
                     price: Faker::Commerce.price,
                     email: Faker::Internet.email,
                     key: Faker::Bitcoin.address[1..5],
                     category_id: rand(1..5)
                    )
    end
  end
end

CategoryImporter.import
ArticleImporter.import