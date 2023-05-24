class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :end_user
  enum order_status: { waiting_pay: 0, check_pay: 1, creating: 2, preparing_send: 3, already_send: 4 }
  enum payment: { credit_card: 0, transfer: 1 }
  def sum_of_price
    food.add_tax_sales_price * order_count
  end
  #validates :order_status, presence: true意味なかった選択してくださいで更新可能。
end
  #def subtotal  #この記載はcart.rbにもっていく。ここは消す#
   # food.add_tax_sales_price * order_count
  #end
  #enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, shipping_preparation: 3, shipping_completed: 4 }

