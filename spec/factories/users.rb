FactoryBot.define do
  factory :user do
    name {"Test"}
    sequence(:email) { |n| "test#{n}@example.com"}
    password {"test0401"}
    favorite_ball {"ICE STORM"}
  end
end
