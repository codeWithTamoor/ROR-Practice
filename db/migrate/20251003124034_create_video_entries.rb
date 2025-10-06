class CreateVideoEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :video_entries do |t|
      t.string :url

      t.timestamps
    end
  end
end
