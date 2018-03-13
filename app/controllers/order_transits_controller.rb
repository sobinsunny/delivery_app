class OrderTransitsController < ApplicationController
# controller for create api for transation device

  def create
   binding.pry
   order_transit = OrderTransit.new(order_transit_params.merge(order_id: params[:order_id]))
   if order_transit.save
     render json: order_transit, status: :created
   else
     render json: order_transit, status: 500, message: "Can't able to add"
   end
  end



private

  def order_transit_params
    params.require(:order_transit).permit(:locations,:status)
  end


end
