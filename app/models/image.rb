class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :src, ImageUploader
  validates :src, presence: true
end
