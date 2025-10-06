class AddAdminFlagToCustomers < ActiveRecord::Migration[8.0]
  def up
    # Apply the migration (migrate forward)
    add_column :customers, :admin, :boolean, default: false
  end

  def down
    # Rollback the migration (reverse it)
    remove_column :customers, :admin
  end
end  
