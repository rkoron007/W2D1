require_relative "pieces.rb"
require_relative "sliding_piece.rb"

class Rook < Piece
  include SlidingPiece
  def initialize(board, pos, val=:r)
    super
    @val = val
  end

  def move_dirs
    horizonal_dirs
  end
end
