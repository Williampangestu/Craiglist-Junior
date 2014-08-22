class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :email
      t.string :key
      t.belongs_to :category

      t.timestamps
    end
  end
end
