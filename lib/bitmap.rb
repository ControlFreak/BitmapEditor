require 'matrix'
class Bitmap

  attr_accessor :data

  def initialize rows, columns
    raise ArgumentError.new("rows and columns should be greater than 0") if rows < 1 || columns < 1
    matrix = Matrix.build(rows, columns) {"O"}
    @data = matrix
  end


end