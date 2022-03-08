class AddUserIdToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :user_id, :integer, null: false, foreign_key: true
    add_index :scores, :user_id
  end
end
