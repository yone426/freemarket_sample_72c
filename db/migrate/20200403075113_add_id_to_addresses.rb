class AddIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture_id ,:integer 
    add_column :addresses,  :city ,:string
  end
end
