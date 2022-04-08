class Add2columnsToBowlingCenters < ActiveRecord::Migration[6.1]
  def change
    add_column :bowling_centers, :latitude, :float
    add_column :bowling_centers, :longitude, :float
  end
end
