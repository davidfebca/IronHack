prices = [10,12,20]
result = prices.reduce do |sum, x|
  sum + x
end
puts result
