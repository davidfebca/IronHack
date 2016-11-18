require_relative 'ShoppingCart.rb'
require_relative 'Fruit.rb'
require_relative 'Coupon.rb'
require 'pry'

shop = ShoppingCart.new

banana1 = Banana.new(1,"banana1", 20)
banana2 = Banana.new(1,"banana2", 20)
banana3 = Banana.new(1,"Banana3", 20)

apple1 = Apple.new(2,"Apple1", 10)
apple2 = Apple.new(2,"Apple2", 10)
apple3 = Apple.new(2,"Apple3", 10)

orange1 = Orange.new(3,"Orange1", 5)
orange2 = Orange.new(3,"Orange2", 5)
orange3 = Orange.new(3,"Orange3", 5)

grape1 = Grape.new(4,"Grape1", 15)
grape2 = Grape.new(4,"Grape2", 15)
grape3 = Grape.new(4,"Grape3", 15)


watermelon1 = Grape.new(5,"Watermelon1", 50)
watermelon2 = Grape.new(5,"Watermelon2", 50)
watermelon3 = Grape.new(5,"Watermelon3", 50)

coupon1 = Coupon.new("2x1",1,2,1)
coupon2 = Coupon.new("3x2",2,3,2)

shop.add_item(banana1)
shop.add_item(banana2)
shop.add_item(banana2)
shop.add_item(apple1)
shop.add_item(apple2)
shop.add_item(apple3)
shop.add_item(orange1)
shop.add_item(orange2)
shop.add_item(orange3)
shop.add_item(grape1)
shop.add_item(grape2)
shop.add_item(grape3)
shop.add_item(watermelon1)
shop.add_item(watermelon2)
shop.add_item(watermelon3)
shop.add_coupon(coupon1)
shop.add_coupon(coupon2)
#cart before applyCoupons
puts shop.printLines
puts shop.checkout
puts "-"*30
shop.applyCoupons
#cart after applyCoupons
puts shop.printLines
puts shop.checkout
