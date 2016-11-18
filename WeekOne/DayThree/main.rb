
require 'colorize'
require 'pry'
require_relative 'helpers.rb'
require_relative 'game.rb'
require_relative 'door.rb'
require_relative 'item.rb'
require_relative 'player.rb'
require_relative 'room.rb'

class Main
  attr_accessor :game
  def initialize game
    @game = game
  end
  def play
    puts "-"*30
    if(@game.actualPlayer !=nil)
      @game.actualPlayer.roomInfo
    end
    puts "What you want to do now?? Avaiable commands are:"
    @game.showCommands
    user_command = gets.chomp
    if !(@game.commands.include? user_command.upcase)
        Helpers.error
    end
    if user_command.upcase =="I"
      @game.actualPlayer.showInventory
    elsif user_command.upcase =="P"
      #TODO: can have more than one item in the room
      @game.actualPlayer.addToBag(@game.actualPlayer.currentRoom.items)
      @game.actualPlayer.currentRoom.items.clear
    elsif user_command.upcase =="D"
        @game.actualPlayer.dropItem
        puts "The item has beed dropped"
      #I don't like this, refactor, no time...
    elsif (@game.changeRoom user_command)
    elsif user_command.upcase == "EXIT"
      puts "-"*30
      menu
    else
      Helpers.error
    end
    play
  end
  def menu
    if !(@game.players.any?)
      puts "+++++++++ Welcome to my Super Cool Game of Rooms +++++++++".colorize(:blue)
    end
    puts "What you want to do now??\n Create Player => create\n Choose Player => choose\n"
    command = gets.chomp
    if command =="create"
      puts "Whats your name??"
      name = gets.chomp
      if(name.length>0)
        #the player allways starts at room 1
        room1 = @game.findRoom(1)
        player = Player.new(name,room1)
        @game.addPlayer(player)
        puts "The player #{name} has been created".colorize(:green)
        menu
      end
    elsif command == "choose"
      if !(@game.players.any?)
        puts "First you have to create players".colorize(:red)
        menu
      end
      puts "Choose one!"
      @game.showPlayers
      user_input = gets.chomp
      player = @game.findPlayer(user_input)
      if(player != nil)
        @game.actualPlayer = player
        puts "Now, you are the player #{player.name}. Enjoy!".colorize(:green)
        play
      else
        puts "The game can't find the player. Try again"
        menu
      end
    else
      Helpers.error
      menu
    end
  end
end

game = Game.new
#rooms
room1 = Room.new(1,"The Room of Pain","You are in an empty room full of flowers.")
room2 = Room.new(2,"The Room of Anguish","You are in room 2")
room3 = Room.new(3,"The Room of Death","You are in room 3")
room4 = Room.new(4,"The Room of Caos","You are in room 4")
room5 = Room.new(5,"The Room of Discordia","You are in room 5")
#room1 stuff
door1 = Door.new(1,"La puerta infernal", "N",2)
room1.addDoor(door1)
#room2 stuff
door2 = Door.new(2,"La puerta infernal", "S",1)
door3 = Door.new(3,"El arco del mal", "E",3)
door4 = Door.new(4,"Pain door", "W",4)
door5 = Door.new(5,"La puerta xupiflower", "N",5)
item1 = Item.new("Aidan's Revenge","10.4 Damage Per Second")
room2.addDoor(door2)
room2.addDoor(door3)
room2.addDoor(door4)
room2.addItem(item1)
#room3 stuff
door6 = Door.new(6,"El arco del mal", "W",2)
room3.addDoor(door6)
#room4 stuff
door7 = Door.new(7,"Pain door", "E",2)
room4.addDoor(door7)

game.addRoom(room1)
game.addRoom(room2)
game.addRoom(room3)
game.addRoom(room4)
game.addRoom(room5)
main = Main.new(game)
main.menu
