class LineItemsController < ApplicationController
 
  def create
    if user_signed_in?
      current_user.cart ||= current_user.build_cart ##review this line of code!
      current_user.cart.add_item(params[:item_id])
      current_user.cart.save
      current_user.save
      redirect_to cart_path(current_user.cart)
    else
      flash[:error] = "You must sign in to add to cart."
      redirect_to new_user_session_path
    end
  end
  
  def destroy
    current_user.cart.remove_line_item(params[:id])
    current_user.cart.save
    redirect_to cart_path(current_user.cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: @current_cart)
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.quantity = params[:number]
    @line_item.save
    redirect_back(fallback_location: @current_cart)
  end

end
