class RemoveshippingareaFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shippingarea, :string
  end
end
