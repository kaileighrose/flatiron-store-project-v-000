require 'pry'
class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  after_initialize :set_variables

  def add_item(item)
    @item = Item.find(item)
    @check = LineItem.find_by(item_id: item)
    if @check == nil
      @check = LineItem.new(title: @item.title, item_id: item, price: @item.price, cart_id: self.id)
      @item.carts << self
    else
      @check.quantity += 1
      @check.save
    end
    @check
  end

  def line_items
    LineItem.where("cart_id = ?", self.id)
  end

  def total
    self.line_items.each do |l|
      i = Item.find(l.item_id)
      @total += i.price * l.quantity
    end
    @total
  end

  private

  def set_variables
    @total = 0
  end

end
