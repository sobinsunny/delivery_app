class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order, only: %i[show edit update destroy]
  before_action :check_authorized_user, only: %i[show edit update destroy]
  helper_method :previous_address

  def index
    @orders = current_user.orders
  end

  def create
    build_order
    if @order.save
      flash[:success] = 'Successfully Orderd'
      redirect_to order_path(@order)
    else
      flash[:danger] = 'Error! '
      render 'new'
    end
  end

  def new
    @order = Order.new
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      flash[:success] = 'Succesafully upddated order details'
      redirect_to order_path(@order)
    else
      flash[:danger] = 'Error, Please check your inputs'
      render 'new'
    end
  end

  private

  def check_authorized_user
    render text: 'Forbidden', status: 403   unless @order.user_id == current_user.id
  end

  def previous_address
    @previous_delivery_address = current_user.orders.select('distinct delivery_address')
  end

  def set_order
    @order ||= Order.includes(:order_transits).find(params[:id])
  end

  def build_order
    @order = Order.new(order_params.merge(user_id: current_user.id))
  end

  def order_params
    params.require(:order).permit(:pickup_address, :delivery_address, :item_name)
  end
end
