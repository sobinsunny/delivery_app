class OrderTransit < ApplicationRecord
  attr_accessor :status

  validates :location, presence: true
  validates :agent_name, presence: true
  validates :agent_phone_number, presence: true

  belongs_to :order
  after_save :update_order_status

  private

  # updating status of parent order

  def update_order_status
    order.delivery_status = status
    order.save
  end
end
