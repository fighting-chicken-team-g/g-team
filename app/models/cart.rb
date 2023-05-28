class Cart < ApplicationRecord
  belongs_to :end_user
  belongs_to :food

  has_one_attached :food_image

  def get_food_image(width, height)
    food_image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_sales_price
    (tax_free_price * 1.1).round
  end

  def sum_of_price
    food.add_tax_sales_price * order_count
  end
end
