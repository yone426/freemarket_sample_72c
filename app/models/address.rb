class Address < ApplicationRecord
  belongs_to :user,optional: true
  validates :zipcode, :prefectures ,:municipalities,:address, presence: true
  YUBIN = ^\d{3}-\d{4}$
  TODOUHUKEN = /\A[一-龥]+\z/


  validates :zipcode,numericality: :only_integer,format: {with: YUBIN}
  validates :prefectures,:municipalities, format: {with: TODOUHUKEN }
  validates :address,numericality: :only_integer
end
