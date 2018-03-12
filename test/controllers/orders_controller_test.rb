require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest

  test "should list all user orders" do
    get orders_path
    assert_response :success
  end

  test "should get show selected orders" do
    order = create(:order)
    get orders_path(order.id)
    assert_response :success
  end

  test "should get create order" do
    post orders_path ,params: { order:attributes_for(:order) }
    assert_response :success
  end

  test "should update the status order" do
    patch '/orders/1'
    assert_response :success
  end

end
