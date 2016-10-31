# try to use classes      (blueprint of object)
# caffee main class, wallet class, food class (sides sub class), consumer class

# ---------- Basic Objectives ----------
# user chooses from a list of main dishes
# user chooses 2 side dish items
# computer repeats user order
# computer totals lunch items and displays total
# ------------ Bonsu Objectives ------------
# user can choose as mnay 'add-on' items as they want befoer getting total
# user can clear their choices and start over
# user has a wallet total they start with and their choices cant exceed what they can pay for
# program is in a loop to keep asking the userto make new orders until they type'quit' at any time
# main dish and side items have descriptions with them and user has option to view description before order (hashes)
# description of food can have multiple options like nutrition facts, calorites, fat content (nested hashes)
# display to user not only their totoal but the total fat content.calories.carbs
# have an option to display
require 'pry'

@customer_food_order = []
@customer_snack_order = []

@food = [
  {food: 'Pretzel', price: 1.50},
  {food: 'Nachos', price: 1.00},
  {food: 'Hotdog', price: 1.75},
  {food: 'Hamburger', price: 1.75}
]

@snack = [
  {snack: "Peanuts", price: 0.75},
  {snack: "Cracker Jacks", price: 0.75},
  {snack: "Roasted Almonds", price: 1.00}
]

def main_menu
  puts "\nBallpark snack shack, what can I help you with?"
  puts '1. Menu'
  puts '2. Order'
  puts '3. Exit'
  menu_select
end

def menu_options
  puts "\n Food options"
    @food.each { |x, i| puts " #{x[:food]} |" " $#{x[:price]} |" }
  puts "\n Snack options"
    @side_snack.each { |x, i| puts " #{x[:snack]} |" " $#{x[:price]} |" }
  main_menu
end

def order_select_main
  puts 'Which main food would you like to get?'
  @food.each_with_index { |x, i| puts " #{i + 1}. #{x[:food]} |" " $#{x[:price]} |" }
    main_food = gets.strip.to_i
    case main_food
    when (0..4)
      @customer_food_order << @food[main_food]
      puts "You've added: #{@customer_food_order[0][:food]}."
    end
    order_select_side
end

def order_select_side
  puts "\nWhich side order would you like?"
  @snack.each_with_index { |x, i| puts " #{i + 1}. #{x[:snack]} |" " $#{x[:price]} |" }
  side_food = gets.strip.to_i - 1
  case side_food
  when (0..4)
    @customer_snack_order << @snack[side_food]
    puts "You've added: #{@customer_snack_order[0][:snack]}."
  end
  # puts 'Would you like to add another side? Y / N'
  #   continue = gets.chomp.downcase
  #   case continue
  #   when 'y'
  #     order_select_side
  #   when 'n'
  #     repeat_order
  #   when 'quit', 'exit'
  #     exit(0)
  #   else
  #     puts 'Invalid input, try again'
  #     continue
  #   end
end


def repeat_order
  puts "\nYour order is: #{@customer_food_order[0][:food]}, #{@customer_snack_order[0][:snack]}, #{@customer_snack_order[1][:snack]}."
  puts 'Ready to checkout? Y / N'
  ready = gets.strip.downcase
  if ready == 'y'
  checkout
  else
  main_menu
  end
end

def checkout
  @total = @customer_food_order[0][:price] + @customer_snack_order[0][:price] + @customer_snack_order[1][:price]
  puts 'Your total is:'
  puts @total
end

def menu_select
  customer_choice = gets.strip.downcase
  case customer_choice
  when '1', 'menu'
    menu_options
  when '2', 'order'
    order_select_main
  when '3', 'quit', 'exit'
    exit(0)
  end
end

def running
  main_menu
  order_select_side
  repeat_order
  running
end

running
