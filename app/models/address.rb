class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true
  belongs_to_active_hash :prefecture
  
  TODOUHUKEN = /\A[一-龥]+\z/
  
  
  validates :zipcode, :prefecture_id ,:municipalities,:address, presence: true
  validates :zipcode,numericality: :only_integer
  validates :municipalities, format: {with: TODOUHUKEN }
  validates :address,numericality: :only_integer
end
