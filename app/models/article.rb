class Article < ActiveRecord::Base
  belongs_to :category
  # Remember to create a migration!
end
