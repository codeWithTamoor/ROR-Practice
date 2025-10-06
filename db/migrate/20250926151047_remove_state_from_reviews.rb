class RemoveStateFromReviews < ActiveRecord::Migration[8.0]
  def change
    remove_column :reviews, :state, :integer
  end
end
