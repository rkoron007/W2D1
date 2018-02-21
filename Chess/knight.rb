require_relative "pieces.rb"
require_relative "stepable.rb"

class Knight < Piece
  include Stepable
  def initialize(board,pos,val = :knt)
    super
    @val = val
  end

end
