class AddPointToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :point, :integer
  end
end
