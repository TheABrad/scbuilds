FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User #{n}" }
    sequence(:email)    { |n| "user_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end
