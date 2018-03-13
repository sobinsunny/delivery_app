class Api::OrderTransitsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  # haveto impliemnetapi tokenbased authentication

  def create
    order_transit = OrderTransit.new(order_transit_params)
    if order_transit.save
      brodcast_order_update(order_transit)
      render json: order_transit, status: :created
    else
      render json: order_transit, status: 500, message: "Can't able to add"
    end
  end

  private

  def brodcast_order_update(order_transit)
    ActionCable.server.broadcast('orders',
                                 current_location: order_transit.location,
                                 order_status: order_transit.order.delivery_status,
                                 agent_name:  order_transit.agent_name,
                                 order_id: order_transit.order.id,
                                 agent_phone_number: order_transit.agent_phone_number)
  end

  def order_transit_params
    params.require(:order_transit).permit(:location, :status, :order_id, :agent_name, :agent_phone_number)
  end
end
