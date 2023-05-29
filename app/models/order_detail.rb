class OrderDetail < ApplicationRecord
  belongs_to :food
  belongs_to :order
  
  enum production_status: { production_none: 0, production_wait: 1, production: 2, production_finish: 3 }
  
  def sum_of_price
    food.add_tax_sales_price * order_detail_count
  end
end
