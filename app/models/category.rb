class Category < ApplicationRecord
  has_many :products  #たくさんの商品にこのカテゴリーモデルが付与されているため
  has_ancestry
end
