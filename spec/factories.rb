FactoryGirl.define do
  factory :user do
    provider "Google"
    user_name "user_name_#{Random.rand(100)}"
    uid "#{Random.rand(100)}#{Random.rand(1000)}"
    name "Name"
  end
end