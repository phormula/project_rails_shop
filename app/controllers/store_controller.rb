class StoreController < ApplicationController
  
  def index
    @items = Item.where(category_id: "1").limit(6)
    @categories = Category.all
    @parts = Item.where(category_id: "2").limit(4)
    @acces = Item.where(category_id: "3").limit(4)
  end
  
end
