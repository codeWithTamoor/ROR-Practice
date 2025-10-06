class AddAgeToPublishers < ActiveRecord::Migration[8.0]
  def change
    add_column :publishers, :age, :integer
  end
end
