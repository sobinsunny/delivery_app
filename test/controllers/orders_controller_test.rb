require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # Test order controller

  def setup
    user = create(:user) if user.nil?
    post login_url, params: { user_sign_in: { email: user.email, password: user.password } }
  end

  test 'should list all user orders' do
    get orders_url
    assert_response :success
  end

  test 'should get show selected orders' do
    order = build_stubbed(:order)
    get orders_path(order.id)
    assert_response :success
  end

  test 'should create an order' do
    assert_difference 'Order.count' do
      post '/orders', params: { order: attributes_for(:order) }
    end
  end
end
