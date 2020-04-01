class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string,null: false
    add_column :users, :fullname, :string,null: false
    add_column :users, :fullname_katakana, :string,null: false
    add_column :users, :phone_number, :integer,null: false
    add_column :users, :birthday, :integer,null: false
  end
end
