require 'date'
class ShoppingCart
  def initialize
    @items = []
    @coupon = []
  end
  def add_item(item)
  	@items.push(item)
  end
  def add_coupon(coupon)
    @coupon.push(coupon)
  end
  def printLines
    fruits = ""
    #TODO: puts the same fruits together
    @items.each do |item|
        fruits += "#{item.name} #{item.getPrice}€\n"
    end
    fruits
  end
  def filterItem id
    result = @items.select do |item|
        item.id == id
      end
  end
  def findItem id
    result = @items.find do |item|
        item.id == id
      end
  end
  def applyCoupons
    new_items = []
    #fix this
    @coupon.each do |coupon|
      same_fruits = filterItem coupon.apply_to
      count_fruits = same_fruits.length
      to_take = count_fruits / coupon.minimum_items
      same_fruits.take(to_take).each do |item|
      new_items.push(item)
      end
    end
    @items = @items - new_items
  end
  def checkout
  	total = 0
  	@items.each do |item|
  		total += item.price
  	end
  	total
  end
end
