class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.string :food_name, null: false
      t.text :introduction, null: false
      t.integer :tax_free_price, null: false
      t.boolean :sales_status, null: false, default: false
    end
  end
end
