  require 'test_helper'

  class OrderUpdateSericeTest < ActiveSupport::TestCase
    def setup
      @order_transits = create(:order_transit)
    end

    test 'Check serices is working' do
      order_service = OrderUpdateService.inform_client('order', @order_transits)
      assert_equal true, order_service.nil?
    end

    test 'Check succefull connection errors' do
      assert_nothing_raised do
        order_service = OrderUpdateService.inform_client('order', @order_transits)
      end
    end
    test 'Check  action cable connection established' do
      assert_difference 'ActionCable.server.connections.length', 1  do
        OrderUpdateService.inform_client('order', @order_transits)
      end
    end

  end
