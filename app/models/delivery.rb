class Delivery < ApplicationRecord
  belongs_to :end_user
  def delivery_address_for_view
  '〒' + post_code + ' ' + address + ' ' + delivery_name
  end
end
