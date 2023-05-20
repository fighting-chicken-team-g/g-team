class Food < ApplicationRecord
  
  has_many :carts, class_name: "Cart", foreign_key: "end_user_id", dependent: :destroy
  has_many :order_details, class_name: "Order_detail", foreign_key: "order_id", dependent: :destroy
  belongs_to :genre
  
  has_one_attached :food_image
  
  def get_food_image
    (food_image.attached?) ? food_image : 'no_image.jpg'
  end
  
  def add_tax_sales_price
  (tax_free_price * 1.08).round
  end
  
  #バリデーションを後で入れるvali
end
