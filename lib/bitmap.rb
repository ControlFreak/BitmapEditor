require 'matrix'
require 'singleton'
class Bitmap
  include Singleton

  attr_accessor :data

  def initialize
    @data = []
  end

  def add(rows, columns, character="O")
    raise ArgumentError.new("rows and columns should be greater than 0") if rows < 1 || columns < 1
    raise ArgumentError.new("rows and columns should be less than or equal to 250") if rows > 250 || columns > 250
    @data = Matrix.build(rows, columns) {character}
  end

  def clear
    raise ArgumentError.new("rows and columns should be greater than 0") if self.data == []
    @data = Matrix.build(self.data.row_count, self.data.column_count) {"O"}
  end

  def set_value_at_index value, row_index, column_index
    raise StandardError if self.data.empty?
    raise StandardError if 1 > row_index  && row_index > self.data.row_count || 1 > column_index && column_index > self.data.column_count
    self.data.send(:[]=, row_index, column_index, value)
  end


end