class OrderDetail < ApplicationRecord
  belongs_to :food
  belongs_to :order
  def sum_of_price
    food.add_tax_sales_price * order_detail_count
  end
end
