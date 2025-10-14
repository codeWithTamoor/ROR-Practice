class FixForeignKeysForCompositeProducts < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :cart_items, :products
    remove_column :cart_items, :product_id
  end
end
