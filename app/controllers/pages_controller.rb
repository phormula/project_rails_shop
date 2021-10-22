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
      
    def search
      @find = WikiDict.where("word = ?", params[:q]).or(WikiDict.where('word LIKE ?', "#{params[:q]}%")).group("word")
      render json: @find
    end
    
  end
  