class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :food_id, null: false
      t.integer :order_id, null: false
      t.integer :order_detail_count, null: false
      t.integer :tax_price, null: false
      t.integer :production_status, null: false, default: 0
    end
  end
end
