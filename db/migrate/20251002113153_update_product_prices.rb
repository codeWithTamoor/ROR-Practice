class UpdateProductPrices < ActiveRecord::Migration[8.0]
  def up
    execute "Update products set name ='Iphone' "
  end
  def down
    execute "Update products set name ='Samsung'  where name='Iphone';"
  end
end
