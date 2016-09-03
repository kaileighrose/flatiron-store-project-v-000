FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    sequence(:email) { |n| "user#{n}@example.com" }
    password "please123"
  end
end
