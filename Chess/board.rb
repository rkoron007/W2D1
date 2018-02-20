
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(1){Array.new(8){Piece.new}} +
    Array.new(1){Array.new(8){NullPiece.new}} +
    Array.new(1){Array.new(8){Piece.new}}
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

  def valid_pos?(pos)
    self[pos].class == NullPiece
  end

end

class Piece
  attr_reader :val
  def initialize(val = "x")
    @val = val
  end

  def inspect
    "#{val}"
  end
end

class NullPiece < Piece
  def initialize
    super("o")
  end

  def inspect
  "#{val}"
  end
end
