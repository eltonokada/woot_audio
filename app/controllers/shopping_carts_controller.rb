class ShoppingCartsController < ApplicationController
  before_filter :extract_shopping_cart

  def create
    @product = Product.find(params[:product_id].to_i)
    @shopping_cart.add(@product, @product.price, params[:quantity].to_i)
    redirect_to shopping_cart_path
  end

  def show

  end

  def destroy
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product, params[:quantity].to_i)
    redirect_to shopping_cart_path    
  end

  def update
    item = @shopping_cart.shopping_cart_items.where(item_id: params[:product_id]).last
    item.update_quantity(params[:quantity])
    render nothing: true
  end

  private
  def extract_shopping_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end
end