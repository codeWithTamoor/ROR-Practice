class ChangeRatingTypeInReviews < ActiveRecord::Migration[8.0]
  def change
    change_column :reviews, :rating, :decimal, precision: 5, scale: 2
  end
end
