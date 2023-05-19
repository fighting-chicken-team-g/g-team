class Food < ApplicationRecord
  has_many :carts, class_name: "Cart", foreign_key: "end_user_id", dependent: :destroy
  has_many :order_details, class_name: "Order_detail", foreign_key: "order_id", dependent: :destroy
  belongs_to :genre
end
