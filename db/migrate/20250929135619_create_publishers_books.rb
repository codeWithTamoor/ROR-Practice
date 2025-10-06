class CreatePublishersBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :publishers_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.date :published_on

      t.timestamps
    end
  end
end
