require 'test_helper'

# Testing Login

class UserTest < ActiveSupport::TestCase
  test 'User can able to register' do
    user = build(:user)
    assert user.valid?
  end

  test ' Should not allow invalid Registration' do
    create(:user)
    registration_params = attributes_for(:user, password: 'admin')
    user = User.new(registration_params)
    assert_not user.valid?
  end

  test 'Should allow valid Registration ' do
    user = create(:user)
    assert_equal true, user.valid?, 'User Registration not working'
  end

  # Testing Registration

  test 'Should not allow invalid login' do
    create(:user)
    sign_in_params = attributes_for(:login, password: 'admin')
    user_login = User::SignIn.new(sign_in_params)
    refute user_login.valid?
  end

  test ' Should not allow a valid login' do
    create(:user)
    sign_in_params = attributes_for(:login)
    user_login = User::SignIn.new(sign_in_params)
    assert user_login.save, 'User Login not wotking'
  end
end
