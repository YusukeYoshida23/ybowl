class AddColumnsToBowlingCenters < ActiveRecord::Migration[6.1]
  def change
    add_column :bowling_centers, :name, :string
    add_column :bowling_centers, :address, :string
    add_column :bowling_centers, :phone_number, :varchar
    add_column :bowling_centers, :hp, :varchar
  end
end
