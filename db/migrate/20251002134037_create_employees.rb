class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id

      t.timestamps
    end
  end
end
