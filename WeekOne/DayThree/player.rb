class Player
  attr_accessor(:name,:currentRoom,:bag)
  def initialize name, currentRoom
    @name = name
    @currentRoom = currentRoom
    @bag = []
  end
  def showInventory
    puts "**** Your inventory ****".colorize(:yellow)
    @bag.each do |item|
      puts "#{item.name}, #{item.description}"
    end
  end
  def addToBag items
    if !(items.any?)
      puts "There's no items in the room".colorize(:green)
    else
      item = items.first
      @bag.push(item)
      puts "You have added the item #{item.name}".colorize(:green)
    end
  end
  def dropItem
    @bag.each do |item|
      @currentRoom.items.push(item)
    end
  end
  def roomInfo
    puts "You are in #{@currentRoom.name}\n#{@currentRoom.description}".colorize(:blue)
    @currentRoom.doors.each do |door|
      puts "There is a door called #{door.name} at #{door.location}".colorize(:light_blue)
    end
    @currentRoom.items.each do |item|
      puts "OMG!! There is a item called #{item.name}. #{item.description}".colorize(:yellow)
    end
  end
end
