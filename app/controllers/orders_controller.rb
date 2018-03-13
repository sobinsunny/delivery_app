class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order, only: %i[show edit destroy]

  def index
    @orders = current_user.orders
  end

  def create
    build_order
    if @order.save
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def new
    @order = Order.new
    @previous_delivery_locations  = current_user.orders(:delivery_address).select('distinct delivery_address')
  end

  def show; end

  def edit; end

  def update; end

  private

  def set_order
    bind
    Order.find(params[:id])
  end

  def build_order
    @order = Order.new(order_params.merge(user_id: current_user.id))
  end

  def order_params
    params.require(:order).permit(:pickup_address, :delivery_address)
  end
end
