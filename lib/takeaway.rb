class Takeway

# menu is a required object in this dependency injection so no other option provided
  def initialize(menu:)
    @menu = menu
  end


  def print_menu
    menu.print
  end

  private

  attr_reader :menu
end
