require '.lib/cell'
require '.lib/matrix'
class Run
  # attr_accessor :cells
  def initialize(row, col)
    @cells = Matrix.zero(row, col)
    @cells = Matrix.build(row, col)

  end
end
