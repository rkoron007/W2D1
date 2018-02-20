require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    print "-----------------"
    puts
    @board.grid.each do |row|
      row.each_with_index do |piece, i|
        if i == (row.length-1)
          print "|"
          print piece.inspect
          print "|"
        else
          print "|"
          print piece.inspect
        end
      end
      puts
      print "-----------------"
      puts
    end
  end

end


b = Display.new(Board.new)

b.render
