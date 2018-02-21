
class Piece

  attr_accessor :val, :board, :pos
  def initialize(board, pos, val = :b)
    @board = board
    @pos = pos
    @val = val
  end

  def inspect
    "#{val}"
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def move

  end

  def pos=(value)
  end

  def move_into_check?(end_pos)

  end

end
