FactoryBot.define do
  factory :score do
    point {150}
    association :user
    association :bowling_center
  end
end
