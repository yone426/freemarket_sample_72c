class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user ,optional: true
  belongs_to :category #新たに追加したリレーション 一つの商品には一つのカテゴリが付属しているため
  
  has_many :images,dependent: :destroy
  has_many :comments
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :likes
  has_many :users, through: :likes

  validates :name, :price, :details, :category_id, :condition, :exhibition, :shippingdate, :prefecture_id, presence: true
  validates_associated :images
  validates :images, presence: true

  before_create :change_product
  def change_product
    self.status = 0
  end

  def self.productsearch(productsearch)
      Product.where('name LIKE ?', "%#{productsearch}%")
    
  end

end

