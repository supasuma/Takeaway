require 'order'
class Takeway

# menu is a required object in this dependency injection so no other option provided
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end


  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order
end
