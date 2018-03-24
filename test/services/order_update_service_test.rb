require 'test_helper'

class OrderUpdateSericeTest < ActiveSupport::TestCase
  def setup
    @order_transits = create(:order_transit)
  end

  test 'Check serices is working' do
    order_service = OrderUpdateService.inform_client('order', @order_transits)
    assert_equal true, order_service.nil?
  end
end
