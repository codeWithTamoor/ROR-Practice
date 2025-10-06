class CreateJoinsTablePublishersBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :joins_table_publishers_books do |t|
      t.timestamps
    end
  end
end
