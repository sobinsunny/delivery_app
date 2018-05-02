class OrderUpdateService
  def self.inform_client(channel_name, order_transit)
    message_params =  {
                        current_location: order_transit.location,
                        order_status: order_transit.order.delivery_status,
                        order_status: order_transit.order.delivery_status,
                        agent_name: order_transit.agent_name,
                        order_id: order_transit.order.id,
                        agent_phone_number: order_transit.agent_phone_number
                      }
    ActionCable.server.broadcast(channel_name, message_params)

  end
end
