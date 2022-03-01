class RemoveBowleddateFromScores < ActiveRecord::Migration[6.1]
  def change
    remove_column :scores, :bowled_date, :datetime
    remove_column :scores, :score, :integer
  end
end
