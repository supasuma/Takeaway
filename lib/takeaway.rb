require './lib/order'
require './lib/sms'
class Takeaway

# menu is a required object in this dependency injection so no other option provided
  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
