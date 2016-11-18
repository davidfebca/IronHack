class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]
#Use the each method to print more information about each home. 
homes.each do |home|
  puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"
end
#Map the array of homes into an array of their cities
cities = []
cities = homes.map do |home|
  home.city
end
puts cities
#Map the array of homes into an array of their prices. 
#Use that array of prices to get the average price of homes. 
#What collection method should you use for the average?
prices = []
prices = homes.map do |home|
  home.price
end
#method 1
total_prices = 0.0
homes.each do |home|
  total_prices = total_prices + home.price
end
#method 2 => ok
total_prices = homes.reduce(0.0) do |sum, home|
  sum + home.price
end
puts "The average price is:"
puts total_prices / homes.length