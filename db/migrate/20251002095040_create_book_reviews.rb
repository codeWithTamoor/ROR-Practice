class CreateBookReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :book_reviews do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
