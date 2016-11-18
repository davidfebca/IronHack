class Room
  attr_accessor(:id,:name,:description,:items,:doors)
  def initialize (id,name,description)
    @items = []
    @doors = []
    @id = id
    @name = name
    @description = description
  end
  def addItem item
    @items.push(item)
  end
  def addDoor door
    @doors.push(door)
  end
end
