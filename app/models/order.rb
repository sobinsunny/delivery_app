class Order < ApplicationRecord
  enum delivery_status: %i[pending_pickup in_transit delivered]

  validates :pickup_address, presence: true
  validates :delivery_address, presence: true
  validates :item_name, presence: true

  validate :check_delivery_status, if: :delivery_address_changed?

  belongs_to :user
  has_many :order_transits, dependent: :destroy

  def check_delivery_status
    errors.add(:delivery_address, "Can't update after delivery") if delivered?
  end
end
