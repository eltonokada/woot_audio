class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :shopping_cart_items

  def shopping_cart_items
    if !session[:shopping_cart_id].nil?
      @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    end
  end

end
