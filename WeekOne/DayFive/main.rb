require_relative 'Helpers/board_parser.rb'
require_relative 'Helpers/move_parser.rb'

board = BoardParser.new('Inputs/board.txt').parse
moves = MoveParser.new('Inputs/moves.txt').parse
puts board
