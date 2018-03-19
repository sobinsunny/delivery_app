require 'test_helper'

class OrderTransitsControllerTest < ActionDispatch::IntegrationTest
  test 'Should able to create' do
    order = create(:order)
    post api_order_transits_path, params: { order_transit: attributes_for(:order_transit).merge({order_id: order.id}) }
    assert_response :success
  end
end
