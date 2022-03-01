class CreateBowlingCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :bowling_centers do |t|

      t.timestamps
    end
  end
end
