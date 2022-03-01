class AddBowleddateToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :bowled_date, :datetime
    add_column :scores, :score, :integer
  end
end
