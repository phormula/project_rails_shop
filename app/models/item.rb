class Item < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :line_items
  has_many :carts, through: :line_items 
  has_many :comments
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {message: "must be a number"}
  validates :inventory, presence: true
  validates :inventory, numericality: {message: "must be a number"}
  
  def self.available_items
    self.all.select do |item|
      item.inventory != 0
    end
  end
end
