class Product < ApplicationRecord
  belongs_to :user
  has_many :images 
  has_many :main_categories
  has_many :comments
  has_many :likes
end
