class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true
  belongs_to_active_hash :prefecture
  
 
  ZENKAKU=/\A[ぁ-んァ-ン一-龥]/
  
  validates :zipcode, :prefecture_id ,:municipalities,:address, presence: true
  validates :zipcode,numericality: :only_integer
  validates :address,numericality: :only_integer
  validates :municipalities,format: {with:ZENKAKU}

end
