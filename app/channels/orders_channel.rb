
class OrdersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'orders'
  end
  def receive(data)
    data
  end
end
#
