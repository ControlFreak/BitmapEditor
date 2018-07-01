require 'matrix'
require 'singleton'
class Bitmap
  include Singleton

  attr_accessor :data

  def initialize
    @data = {}
  end

  def add(rows, columns)
    raise ArgumentError.new("rows and columns should be greater than 0") if rows < 1 || columns < 1
    raise ArgumentError.new("rows and columns should be less than or equal to 250") if rows > 250 || columns > 250
     # @data = Matrix.build(rows, columns) {"O"}
    @data = Array.new( rows, Array.new(columns, 0) )
  end



end