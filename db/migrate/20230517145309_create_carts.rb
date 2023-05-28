class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|

      t.timestamps
      t.integer :end_user_id, null: false
      t.integer :food_id, null: false
      t.integer :order_count, null: false
    end
  end
end
