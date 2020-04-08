class AddCategoryIdToProduction < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, foreign_key: true
    remove_column :products, :categories, :string
  end
end
