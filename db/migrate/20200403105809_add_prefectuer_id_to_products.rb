class AddPrefectuerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prefecture_id, :integer
    add_column :products, :city, :string
  end
end
