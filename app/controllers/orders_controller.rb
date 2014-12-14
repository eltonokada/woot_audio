class OrdersController < ApplicationController


  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|

      if @order.save
        shopping_cart = ShoppingCart.find(session[:shopping_cart_id])

        shopping_cart.shopping_cart_items.each do |item|
          product = Product.find(item.item_id)
          product.quantity = (product.quantity.to_i - item.quantity.to_i)
          product.save!
          OrderProduct.create(product_id: item.item_id, quantity: item.quantity, order_id: @order.id)
        end

        shopping_cart.clear
        
        format.html { redirect_to root_path, notice: "Order sent!" }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :city, :state, :zip, :email, :phone, :creditcard_number, :creditcard_type, :creditcard_holder, :creditcard_valid_date, :creditcard_ccc)
    end
end
