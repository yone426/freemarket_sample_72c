class Address < ApplicationRecord
  belongs_to :user,optional: true
  validates :zipcode, :prefectures ,:municipalities,:address, presence: true
end
