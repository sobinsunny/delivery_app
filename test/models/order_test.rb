require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end
  test 'Order should validate entry' do
    order = Order.new
    assert_not order.save
  end

  test 'Order should save with values' do
    order = build(:order)
    assert order.valid?
  end

  test 'Order should through validation errors without ' do
    order = Order.new
    order.save
    assert_not order.valid?
    assert_not_nil order.errors[:delivery_address]
    assert_not_nil order.errors[:user_id]
    assert_not_nil order.errors[:pickup_address]
  end
end
