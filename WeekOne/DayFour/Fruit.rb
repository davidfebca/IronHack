class Fruit
  attr_reader :id,:name
  attr_accessor :price
  def initialize(id,name, price)
      @id = id
      @name = name
      @price = price
  end
  def getPrice
    @price
  end
end
class Banana < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def getPrice
    @price
  end
end
class Watermelon < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def price
    @price
  end
end

class Grape < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def getPrice
    @price
  end
end

class Orange < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def price
    @price
  end
end

class Apple < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def price
    @price
  end
end
class WaterMelon < Fruit
  def initialize id,name, price
    super(id,name,price)
  end
  def price
    @price
  end
end
