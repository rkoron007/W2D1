require_relative "pieces.rb"

class NullPiece < Piece
  include Singleton
  def initialize(board, pos, val = " ")
    super
    @val = val
  end

  def inspect
  "#{val}"
  end
end
