
module SlidingPiece
  HORIZONAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
  DIAGONAL_DIRS = [[-1,1], [1,1], [-1,-1], [1,-1]]

  def moves_dirs
    #overwritten - these are my moves
  end

  def moves
    all_moves = []
    move_dir.each do |pp|
      all_moves << grow_unblocked_moves_in_dir(pp[0],pp[1])
    end
    all_moves
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    unblocked_moves = []
    first = @pos[0]
    second = @pos[1]
    while @board.on_the_board?([first+dx,second+dy])
      first += dx
      second += dy
      unblocked_moves << [first,second]
    end
    unblocked_moves
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def horizonal_dirs
    HORIZONAL_DIRS
  end

end
