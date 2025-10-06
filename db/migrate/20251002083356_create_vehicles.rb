class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :color
      t.integer :price


      t.timestamps
    end
  end
end
