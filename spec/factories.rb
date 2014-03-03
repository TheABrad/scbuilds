FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User #{n}" }
    sequence(:email)    { |n| "user_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end

  factory :build do
    sequence(:title) { |n| "Title #{n}" }
    body "Lorem Ipsum"
  end
end
