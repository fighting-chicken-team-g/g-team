class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :end_user
  enum order_status_method: { waiting_pay: 0, chck_pay: 1, creating: 2, preparing_send: 3, already_send: 4 }

end
