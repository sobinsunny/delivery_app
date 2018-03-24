require 'test_helper'

class OrderUpdateSericeTest < ActiveSupport::TestCase

    def setup
        @order_transits = create(:order_transit)
        @action_cable = ActionCable.server
    end

    # test "Check serices is working" do
    #   OrderUpdateService.inform_client('order',@order_transits)
    #   assert @action_cable, receive(:brodcast)
    # end


end