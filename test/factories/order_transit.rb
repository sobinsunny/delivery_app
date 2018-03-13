FactoryBot.define do
  factory :order_transit do
    location 'Madiwala'
    status 'in_transit'
    order
  end
end
