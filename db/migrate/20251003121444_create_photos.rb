class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :image_url

      t.timestamps
    end
  end
end
