class AddBowlingCenterIdToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :bowling_center_id, :integer
  end
end
