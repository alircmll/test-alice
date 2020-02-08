class Cell
  attr_reader :i, :j

  def initialize(i, j, alive)
    @i = i
    @j = j
    @alive = alive
  end

  def alive?
    @alive ? 1 : 0
  end

  # def n_coordinates
  #   coords = [i - 1, i, i + 1].product([j - 1, j, j + 1])
  #   coords.delete([i, j])
  #   coords
  # end
end
