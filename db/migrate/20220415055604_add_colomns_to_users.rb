class AddColomnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :favorite_ball, :string
  end
end
