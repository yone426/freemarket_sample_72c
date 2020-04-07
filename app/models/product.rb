class Product < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :category　#新たに追加したリレーション　一つの商品には一つのカテゴリが付属しているため
  # has_many :main_categories  main_categoriesというモデルは存在しない?ためコメントアウト
  
  has_many :images
  has_many :comments
  has_many :likes
  accepts_nested_attributes_for :images, allow_destroy: true
  # validates :name, :price, :details, :categories, :condition, :exhibition, :shippingarea, :shippingdate, presence: true
end
