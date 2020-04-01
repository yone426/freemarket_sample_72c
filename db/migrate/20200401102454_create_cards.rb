class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id, foreign_key: true
      t.integer :customar_id, null: false#セキュリティカード
      t.integer :card_id, null: false#カード番号
      t.timestamps
    end
  end
end
