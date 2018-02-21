require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"
require "byebug"

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    print "-----------------"
    puts
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if cursor_here?([i,j]) && @cursor.selected
          print "|"
          print piece.inspect.colorize(:color => :red, :background => :black)
        elsif cursor_here?([i,j])
          print "|"
          print piece.inspect.colorize(:color => :cyan, :background => :black)
        elsif j == (row.length-1)
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

  def cursor_here?(current_pos)
    current_pos == @cursor.cursor_pos
  end

  def play
    render
    cursor.get_input
  end

end


party = Display.new(Board.new)
  10.times do
    party.play
  end
