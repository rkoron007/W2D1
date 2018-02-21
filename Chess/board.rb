# require_relative "pieces.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "queen.rb"
require_relative "null_piece.rb"
require "byebug"

class Board
  MAIN_ROW = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

  attr_accessor :grid
  def initialize
    @grid = Array.new(2){Array.new(8)} +
    Array.new(4){Array.new(8, NullPiece.instance) }+
    Array.new(2){Array.new(8)}
  end

  def first_and_last_row
    # byebug
    @grid[0].each_with_index do |piece, i|
      @grid[0][i] = MAIN_ROW[i].new(@grid, [0,i])
    end
    #
    @grid[7].each_with_index do |piece, i|
      @grid[7][i] = MAIN_ROW[i].new(@grid, [7,i])
    end
  end



  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row,col = pos
    @grid[row][col] = value
  end


  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    if current_piece.class == NullPiece
      raise ArgumentError.new ("Hey, there's no piece here!")
    elsif self[end_pos].class == Piece
      raise ArgumentError.new ("I can't move here- there is someone here!")
    end

    self[end_pos] = current_piece
    self[start_pos] = NullPiece.new
  end

  def on_the_board?(pos)
    possible_length = (0..7).to_a
    return false unless possible_length.include?(pos[0])
    return false unless possible_length.include?(pos[1])
    true
  end

  def valid_pos?(pos)
    return false unless on_the_board?(pos)
    self[pos].class == Piece
  end

end

t = Board.new

t.first_and_last_row

p t.grid
