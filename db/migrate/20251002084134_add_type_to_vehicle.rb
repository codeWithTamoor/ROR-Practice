class AddTypeToVehicle < ActiveRecord::Migration[8.0]
  def change
    add_column :vehicles, :type, :string
  end
end
