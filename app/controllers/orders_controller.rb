class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order, only: %i[show edit update destroy]
  helper_method :previous_address

  def index
    @orders = current_user.orders
  end

  def create
    build_order
    if @order.save
      flash[:success]="Succesfully Orderd"
      redirect_to order_path(@order)
    else
      flash[:danger]="Error Please check your inputs"
      render 'new'
    end
  end

  def new
    @order = Order.new
  end

  def show; end

  def edit;
  end

  def update
    if @order.update(order_params)
      flash[:success]="Succesfully edited Orderd"
      redirect_to order_path(@order)
    else
      flash[:danger]="Error Please check your inputs"
      render 'new'
    end
  end

private

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
    params.require(:order).permit(:pickup_address, :delivery_address,:item_name)
  end

end
