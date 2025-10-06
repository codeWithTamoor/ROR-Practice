class ProductsController < ApplicationController
  def index
    @products = Product.all
  end


  def show
    @product=Product.find(params[:id])
    # @cart_item=current_cart.cart_items.find_by(product_id: @product.id)
  end
end
