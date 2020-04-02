class Address < ApplicationRecord
  belongs_to :user,optional: true
  validates :zipcode, :prefectures ,:municiplities, presence: true
end
