class UpdateBooks < ActiveRecord::Migration[8.0]
  def change
    execute "UPDATE books SET title = 'deciding'"
  end
end
