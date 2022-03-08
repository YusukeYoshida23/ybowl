class AddScoreIdToBowlingCenter < ActiveRecord::Migration[6.1]
  def change
    add_column :bowling_centers, :score_id, :integer
  end
end
