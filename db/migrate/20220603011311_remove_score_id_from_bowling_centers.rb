class RemoveScoreIdFromBowlingCenters < ActiveRecord::Migration[6.1]
  def change
    remove_column :bowling_centers, :score_id, :integer
  end
end
