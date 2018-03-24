FactoryBot.define do
  factory :order do
    item_name 'Car'
    pickup_address 'Madiwala'
    delivery_address 'HSR'

    trait :delivered do
      delivery_status 'delivered'
    end

    user
  end
end
