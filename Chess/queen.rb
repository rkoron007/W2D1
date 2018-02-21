require_relative "pieces.rb"
require_relative "sliding_piece.rb"

class Queen < Piece
  # include SlidingPiece
  def initialize(board, pos, val=:q)
    super
    @val = val
  end

  def move_dirs
    diagonal_dirs + horizonal_dirs
  end

end
