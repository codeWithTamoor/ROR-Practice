class CreatePostEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :post_entries do |t|
      t.text :content

      t.timestamps
    end
  end
end
