require 'test_helper'

class OrderTransitsControllerTest < ActionDispatch::IntegrationTest


  test "Should able to create" do
    order = create(:order)
    post order_order_transits_path(order), params: { order_transit: attributes_for(:order_transit)}
    assert_response :success
  end

end
