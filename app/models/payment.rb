class Payment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :payment_infomation

  validates :item, :user, presence: true
end
