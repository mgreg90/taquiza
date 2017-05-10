require './taquiza_menu'
require 'pry'

FLORIDA_SALES_TAX = 0.075
DEFAULT_TIP = 0.18

# methods

def initialize
  puts "What would you like to do?"
  gets.strip.downcase
end

def show_menu
  puts "\t\t\t\t#{@taquiza_menu[:restaurant]}"
  puts "\t\t\t\t#{@taquiza_menu[:address]}"
  @taquiza_menu[:menu][:sections].each do |section|
    puts "\t#{section[:name]}"
    puts "\t#{section[:description]}" if section[:description]
    puts "\t#{'-' * 40}\n\n"
    section[:items].each do |item|
      puts "\t\t\t#{item[:name]}"
      puts "\t\t#{item[:ingredients].join(', ')}" if item[:ingredients]
      puts "\t\t#{item_options(item)}" if item[:options]
      puts "\t\t\t\t#{price(item)}" if price(item)
      puts
    end
    puts
  end
end

def place_order
  response = ask_for_order(first_order: true)

  @order = []
  until response == 'done ordering'
    if item_names.include?(response.upcase)
      @order += item_by_name(response)
      response = ask_for_order
    else
      response = ask_for_order(error: true)
    end
  end
  puts "You ordered:"
  puts "#{item_names(@order).join(', ')}"
  puts "Coming right up!"
end

def get_the_check
  puts "Here's the check!"
  puts "-" * 40
  puts "|\t\t#{@taquiza_menu[:restaurant]}"
  puts "|\t\t#{@taquiza_menu[:address]}"
  puts "|"
  puts "| #{'*' * 38}"
  puts "|"
  @order.each do |item|
    puts "|\t#{item[:name]}\t\t#{check_price(item[:price])}"
  end
  puts "|"
  puts "| #{'*' * 38}"
  puts "|"
  puts "|\tSubtotal\t\t#{check_price(order_subtotal)}"
  puts "|\tTax\t\t\t#{check_price(order_subtotal * FLORIDA_SALES_TAX)}"
  puts "|\tTip\t\t\t#{check_price(order_subtotal * DEFAULT_TIP)}"
  puts "|\tTotal\t\t\t#{check_price(order_subtotal + tax + tip)}"
  puts "-" * 40
end

# helpers

def tax
  order_subtotal * FLORIDA_SALES_TAX
end

def tip
  order_subtotal * DEFAULT_TIP
end

def item_by_name(name)
  items.select { |item| item[:name] == name.upcase }
end

def items
  @taquiza_menu[:menu][:sections].map { |section| section[:items] }.flatten
end

def item_names(select_items=items)
  select_items.map { |item| item[:name] }
end

def price(item, key=:price)
  if item[key] == 0.0
    nil
  elsif item[key].to_i == item[key]
    item[key].to_i
  else
    item[key]
  end
end

def check_price(price)
  '%.2f' % price
end

def order_subtotal
  @order.map { |item| item[:price] }.reduce(:+)
end

def item_options(item)
  "#{item[:options].map{|option| "#{option[:name]} #{price(option, :additional_price)}"}.join(' | ')}"
end

def ask_for_order(options={})
  puts "That's not on the menu!" if options[:error]
  if options[:first_order]
    puts "What would you like to order?"
    puts "(say 'done ordering' when the order is complete!)"
  else
    puts "What else would you like?"
  end
  gets.strip.downcase
end

#  flow

print `clear`
loop do
  option = initialize
  case option
  when 'show menu'
    show_menu
  when 'place order'
    place_order
  when 'get the check'
    get_the_check
    break
  end
end
