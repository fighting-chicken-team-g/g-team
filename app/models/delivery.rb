class Delivery < ApplicationRecord
  belongs_to :end_user

  validates :post_code, presence:true
  validates :address, presence:true
  validates :delivery_name, presence:true
end
