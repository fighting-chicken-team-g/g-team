class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :end_user
end

def subtotal
   food.add_tax_sales_price * order_detail_count
end