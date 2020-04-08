class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true
  belongs_to_active_hash :prefecture
  
 
  
  
  validates :zipcode, :prefecture_id ,:municipalities,:address, presence: true
  validates :zipcode,numericality: :only_integer
  
  validates :address,numericality: :only_integer
end
