class AddDetailsToVehicle < ActiveRecord::Migration[8.0]
  def change
    add_column :vehicles, :door, :integer
    add_column :vehicles, :engine_cc, :integer
  end
end
