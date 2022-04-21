FactoryBot.define do
  factory :score do
    point {150}
    user_id {1}
    bowling_center_id {1}
    user
    bowling_center
  end
end
