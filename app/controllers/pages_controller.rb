class PagesController < ApplicationController
  
    def bike
      @items = Item.where(category_id: "1")
    end

    def part
      @items = Item.where(category_id: "2")
      @categories = Category.all
    end

    def accessory
      @items = Item.where(category_id: "3")
      @categories = Category.all
    end

    def about
    end
    
  end
  