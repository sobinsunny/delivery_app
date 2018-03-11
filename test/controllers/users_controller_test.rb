require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get register" do
    get '/signup'
    assert_response :success
  end

  test "should able to register" do
    post '/signup', params: { user: {email: 'sobin@gmail.com', password: "admin123", password_confirmation: "admin 123",name: "Sobin" } }
    assert_response :success
  end



end
