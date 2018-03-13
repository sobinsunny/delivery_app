require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = build_stubbed(:user)
    post login_url, params: { user_sign_in: { email: user.email, password: user.password } }
  end

  test 'should list all user orders' do
    get orders_url
    assert_response :success
  end

  test 'should get show selected orders' do
    order = create(:order)
    get orders_path(order.id)
    assert_response :success
  end

  test 'should get create order' do
    post '/orders', params: { order: attributes_for(:order) }
    assert_response :redirect
  end

  test 'should update the status order' do
    patch '/orders/1'
    assert_response :success
  end
end
