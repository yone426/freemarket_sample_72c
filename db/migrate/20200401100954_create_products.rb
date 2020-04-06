class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id, foreign_key: true
      t.string :name, null: false
      t.string :details, null: false
      t.string :categories, null: false
      t.string :price, null: false
      t.string :condition, null: false
      t.string :exhibition, null: false
      t.string :shippingarea, null: false
      t.string :shippingdate, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end

