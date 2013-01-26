FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    name Faker::Name.first_name
    password 'password123'
    password_confirmation 'password123'
  end
end