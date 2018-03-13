require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page' do
    get '/login'
    assert_response :success
  end

  test 'should able to login' do
    user = create(:user)
    post '/login', params: { user_sign_in: { email: user.email, password: user.password } }
    assert_response :redirect
  end

  test 'user should able to logout' do
    delete '/logout'
    assert_response :redirect
  end
end
