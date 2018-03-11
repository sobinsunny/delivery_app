require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get login page" do
    get '/login'
    assert_response :success
  end

  test "should able to login" do
    post '/login', params: { user: {email: 'sobin@gmail.com', password: "admin123" } }
    assert_response :success
  end

  test "should able to logout" do
    delete '/logout'
    assert_response :success
  end

end
