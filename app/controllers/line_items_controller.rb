class LineItemsController < ApplicationController
  
  def new
    @line_item = LineItem.new
  end

  def create
    if current_user.current_cart == nil
      @cart = Cart.create(user_id: current_user.id)
      current_user.current_cart = @cart
      current_user.save
    else
      @cart = current_user.current_cart
    end
    @cart.add_item(params[:item_id])
    @cart.save
    redirect_to cart_path(@cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:title, :quantity, :cart_id, :item_id, :price)
  end
end
