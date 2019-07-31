class CoffeeSale::CLI

  def call
    puts "Welcome to CoffeeIcon: Specials - Enjoy limited time deals on select brands".colorize(:light_blue)
    get_coffees
    list_coffees
    get_user_selection
    # show_coffee_descr(name)
  end
  
  def get_coffees
    # to be scraped instead
    @coffees = CoffeeSale::Coffee.all
  end
  
  def list_coffees
    puts "Choose a number to see coffee details.".colorize(:green)
    @coffees.each.with_index(1) do |coffee, index|
      puts "#{index}. #{coffee.name}"
    end
  end
  
  def get_user_selection
    chosen_coffee = gets.strip.to_i
    show_coffee_descr_for(chosen_coffee) if valid_input(chosen_coffee, @coffees)
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_coffee_descr_for(chosen_coffee)
    coffee = @coffees[chosen_coffee - 1] # -1 because an index of an array always starts at 0
    details = coffee.details
    puts "More information about #{coffee.name}."
  end

end