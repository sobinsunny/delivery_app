class OrderTransit < ApplicationRecord
  attr_accessor :status

  validates :location, presence: true
  validates :agent_name, presence: true
  validates :agent_phone_number, presence: true

  belongs_to :order
  after_save :update_order_status
  after_create_commit :brodcast_order_update

  private

  # updating status of parent order

  def update_order_status
    order.delivery_status = status
    order.save
  end

  def brodcast_order_update
    OrderUpdateService.inform_client('orders', self)
  end
  
end
