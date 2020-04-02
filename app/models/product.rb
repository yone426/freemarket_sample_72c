class Product < ApplicationRecord
  belongs_to :user ,optional: true
  has_many :images
  has_many :main_categories
  has_many :comments
  has_many :likes
  validates :name, :price, :details, :categories, :condition, :exhibition, :shippingarea, :shippingdate, presence: true
end
