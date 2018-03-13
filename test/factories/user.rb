FactoryBot.define do
  factory :user do
    name 'John'
    email 'john@gmail.com'
    password 'admin123'
    password_confirmation 'admin123'
  end

  factory :login, class: 'User' do
    email 'john@gmail.com'
    password 'admin123'
  end
end
