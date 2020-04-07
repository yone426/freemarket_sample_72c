class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user ,optional: true
  has_many :images, dependent: :destroy
  belongs_to :category #新たに追加したリレーション　一つの商品には一つのカテゴリが付属しているため
  # has_many :main_categories  main_categoriesというモデルは存在しない?ためコメントアウト
  
  has_many :comments
  has_many :likes
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, :details, :category_id, :condition, :exhibition, :shippingdate,:prefecture_id, presence: true

end
