module OrderTransitsHelper
  def order_delivered?
    @order.delivered?
  end
end
