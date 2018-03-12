class Order < ApplicationRecord
  enum delivery_status: %i[pending_pickup in_transit delivered]

  validates :pickup_address, presence: true
  validates :delivery_address, presence: true

  belongs_to :user
  has_many :order_transits
end
