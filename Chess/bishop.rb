require_relative "pieces.rb"
require_relative "sliding_piece.rb"

class Bishop < Piece
  # include SlidingPiece
  def initialize(board, pos, val=:b)
    super
    @val = val
  end

  def move_dirs
    diagonal_dirs
  end

end
