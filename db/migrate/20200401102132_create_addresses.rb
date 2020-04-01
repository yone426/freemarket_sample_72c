class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, foreign_key: true
      t.string :zipcode, null: false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.string :address 
      t.string :building
      t.timestamps
    end
  end
end
