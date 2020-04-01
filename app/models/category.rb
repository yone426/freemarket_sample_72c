class Category < ApplicationRecord
  belongs_to :product
  has_many :sub_categories, dependent: :nullify
end
