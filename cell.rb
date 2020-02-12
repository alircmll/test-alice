class Cell
  attr_reader :tabs, :x, :y

  def initialize(tabs, x, y, alive = true)
    @tabs = tabs
    @new_tabs = tabs
    @x = x
    @y = y
    @alive = alive
  end

  def alive?
    @alive ? 1 : 0
  end

  def n_coordinates(x, y)
    coords = [x - 1, x, x + 1].product([y - 1, y, y + 1])
    coords.delete([x, y])
    coords.select { |el| el[0] >= 0 && el[0] <= 15 && el[1] >= 0 && el[1] <= 15 }
  end

  def n_count(x,y)
    sum = 0
    n_coordinates(x, y).each do |coord|
      sum += 1 if tabs[coord[0]][coord[1]] == 1
    end
    return sum
  end

  def new_t
    @tabs.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        if cell == 1 && (n_count(x, y) == 2 || n_count(x, y) == 3)
          @new_tabs[x][y] = 1
        elsif cell == 1 && (n_count(x, y) == 1 || n_count(x, y) == 0)
          #cell devient = 0
          @new_tabs[x][y] = 0
        elsif cell == 0 && n_count(x, y) == 3
          #cell devient = 1
          @new_tabs[x][y] = 1
        elsif cell == 0 || cell == 1 && n_count(x, y) > 3
          #cell devient = 0
          @new_tabs[x][y] = 0
        end
      end
    end
    @new_tabs
  end
end

tabs = [[0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1],
        [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
        [1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0],
        [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
        [0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
        [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
        [0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1],
        [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0],
        [1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
        [0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1],
        [0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1]]


print Cell.new(tabs,0,0).new_t
