class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :end_user
  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, shipping_preparation: 3, shipping_completed: 4 }

  def subtotal  #この記載はcart.rbにもっていく。ここは消す#
    food.add_tax_sales_price * order_count
  end
end
