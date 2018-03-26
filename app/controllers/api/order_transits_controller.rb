class Api::OrderTransitsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  # haveto impliemnetapi tokenbased authentication

  def create
    order_transit = OrderTransit.new(order_transit_params)
    if order_transit.save
      render json: order_transit, status: :created
    else
      render json: order_transit, status: 500, message: "Can't able to add"
    end
  end

  private
  
  def order_transit_params
    params.require(:order_transit).permit(:location, :status, :order_id, :agent_name, :agent_phone_number)
  end
end
