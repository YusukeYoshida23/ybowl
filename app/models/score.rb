class Score < ApplicationRecord
  belongs_to :user
  belongs_to :bowling_center
end
