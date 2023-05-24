class Cart < ApplicationRecord
  belongs_to :end_user
  belongs_to :food

    def add_tax_sales_price
  (tax_free_price * 1.08).round
  end

  def sum_of_price
    food.add_tax_sales_price * order_count
  end
end
