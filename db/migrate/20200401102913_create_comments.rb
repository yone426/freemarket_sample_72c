class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null:false, foreign_key: true
      t.integer :product_id, null:false, foreign_key: true
      t.string :comment, null: false
      t.timestamps
    end
  end
end
