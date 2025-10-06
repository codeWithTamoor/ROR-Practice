class RevertaddDescriptionToProducts < ActiveRecord::Migration[8.0]
  def change
    revert AddDescriptionToProducts
  end
end
