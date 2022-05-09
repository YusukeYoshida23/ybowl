class Score < ApplicationRecord
  belongs_to :user
  belongs_to :bowling_center

  validates :point, presence: true
end
