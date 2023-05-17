class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :end_user_id, null: false
      t.integer :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :delivery_price, null: false
      t.integer :payment, null: false, default: 0
      t.integer :total_price, null: false
      t.integer :order_status, null: false, default: 0
    end
  end
end
