class CartsController < ApplicationController
  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @current_cart = Cart.find(current_user.current_cart_id)
    @user = User.find(@current_cart.user_id)
    @current_cart.line_items.each do |l|
      l.item.inventory -= l.quantity
      l.item.save
    end
    @current_cart.status = "submitted"
    @current_cart.save
    @user.current_cart_id = nil
    @user.save
    redirect_to cart_path(@current_cart)
  end
end
