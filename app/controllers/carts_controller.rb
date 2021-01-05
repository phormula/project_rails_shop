class CartsController < ApplicationController
  def show
    if user_signed_in?
      @cart = Cart.find_by(id: params[:id])
      #$cartq = Cart.count(user_id: current_user)
    else
      @cart = Cart.where(id: "0")
    end
  end
end
