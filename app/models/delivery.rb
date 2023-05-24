class Delivery < ApplicationRecord
  belongs_to :end_user
  def delivery_address_for_view
  '〒' + post_code + ' ' + address + ' ' + delivery_name
  end

  validates :post_code, presence:true
  validates :address, presence:true
  validates :delivery_name, presence:true
end
