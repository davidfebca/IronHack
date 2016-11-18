class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end
homes= [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Stephen's place", "Málaga", 5, 405),
  Home.new("Miguel's place", "Málaga", 3, 90),
  Home.new("Alinas's place", "Málaga", 7, 425),
  Home.new("Tatjana's place", "Málaga", 2, 145),
  Home.new("David's place", "Málaga", 4, 200),
]
def drawLine
  puts "--------------------------"
end
def drawArray homes
  homes.each do |home|
    puts "#{home.name} in #{home.city}, capacity #{home.capacity}, price #{home.price}"
  end
  total_prices = homes.reduce(0.0) do |sum, hm|
    sum + hm.price
  end
  puts "The price average is " + (total_prices/homes.length).to_s
end
def sortByPrice homes
  homes.sort! { |a,b| b.price <=> a.price }
end
def sortByCapacity homes
  homes.sort! { |a,b| b.capacity <=> a.capacity }
end
def filter homes, text
  result= homes.select do |home|
    home.city == text
  end
end
def find homes, price
  home = homes.find do |hm|
    hm.price == price.to_i
  end
  puts "#{home.name} in #{home.city}, capacity #{home.capacity}, price #{home.price}"
end

def init homes
  drawLine
  drawArray(homes)
  drawLine
  puts "What do you want to do now?\nsort => price or capacity \nfilter=> filter by city\nfind => find by price"
  order = gets.chomp
  if order == "sort"
    drawLine
    puts "price or capacity?"
    command = gets.chomp
    if command == "price"
      drawLine
      drawArray(sortByPrice(homes))
    elsif command == "capacity"
      drawLine
      drawArray(sortByCapacity(homes))
    else
      puts "Sorry, invalid command, try again!!"
      init(homes)
    end
  elsif order =="filter"
    drawLine
    puts "Type a city to filter"
    city = gets.chomp
    drawArray(filter(homes,city))
  elsif order =="find"
    drawLine
    puts "Type a price"
    price = gets.chomp
    find(homes,price)
  else
    puts "Sorry, invalid command, try again!!"
    init(homes)
  end
end
init(homes)
