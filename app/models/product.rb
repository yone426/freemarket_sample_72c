class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user ,optional: true
  has_many :images, dependent: :destroy
  has_many :main_categories
  has_many :comments
  has_many :likes
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :price, :details, :categories, :condition, :exhibition, :shippingdate,:prefecture_id, presence: true
end
