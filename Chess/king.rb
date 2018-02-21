require_relative "pieces.rb"
require_relative "stepable.rb"

class King < Piece
  include Stepable
  def initialize(board, pos, val=:K)
    super
    @val = :K
  end

end
