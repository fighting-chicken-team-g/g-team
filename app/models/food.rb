class Food < ApplicationRecord

  has_many :carts, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

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

  validates :food_image, presence: true
  validates :genre_id, presence: true
  validates :food_name, presence: true
  validates :introduction, presence: true
  validates :tax_free_price, presence: true
  #validates :sales_status, presence: true これが入るとエラーになる。
end
