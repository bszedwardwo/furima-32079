class Payment < ApplicationRecord
  belongs_to :item, :user
  has_one    :payment_infomation
end
