class Game
  attr_accessor(:rooms,:players,:actualPlayer,:commands)
  def initialize actualPlayer = nil
    @rooms = []
    @players = []
    @actualPlayer = actualPlayer
    @commands = ["N","S","E","W","I","P","D","EXIT"]
  end
  def addRoom room
    @rooms.push(room)
  end
  def addPlayer player
    @players.push(player)
  end
  def setPlayer player
    @actualPlayer = player
  end
  def showCommands
    result = ""
    @commands.each do |command|
      result += " #{command} "
    end
    puts result
  end
  def showPlayers
    @players.each do |player|
      puts "#{player.name}"
    end
  end
  def findPlayer name
    @players.find do |player|
        player.name = name.downcase
    end
  end
  def findRoom id
    @rooms.find do |room|
      room.id == id
    end
  end
  def changeRoom command
    changeRoom = false
    @actualPlayer.currentRoom.doors.each do |door|
      if (door.location == command.upcase)
        @actualPlayer.currentRoom = findRoom(door.id_room)
        changeRoom = true
      end
    end
    changeRoom
  end
end
