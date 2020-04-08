class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user ,optional: true
  belongs_to :category #新たに追加したリレーション 一つの商品には一つのカテゴリが付属しているため
  
  # def show_first_image
  #   if products.images.src.present?
  #     product.images.src.first
  #   else
  #     "https://placehold.jp/150x150.png"
  #   end
  # end
  
  has_many :images
  has_many :comments
  has_many :likes
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, :details, :category_id, :condition, :exhibition, :shippingdate,:prefecture_id, presence: true

  before_create :change_product
  def change_product
    self.status = 0
  end

end
