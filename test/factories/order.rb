FactoryBot.define do
  factory :order do
    item_name "Car"
    pickup_address 'Madiwala'
    delivery_address 'HSR'
    user
  end
end
