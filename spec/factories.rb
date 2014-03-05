FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User #{n}" }
    sequence(:email)    { |n| "user_#{n}@example.com" }
    password "foobarbaz"
    password_confirmation "foobarbaz"
  end

  factory :build do
    sequence(:title) { |n| "Title #{n}" }
    body "Lorem Ipsum"
  end
end
