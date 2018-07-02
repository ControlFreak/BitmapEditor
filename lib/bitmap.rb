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
    raise ArgumentError.new("rows and columns should be greater than 0") if self.data == []
    raise StandardError if 1 >= row_index  && row_index > self.data.row_count || 1 >= column_index && column_index > self.data.column_count
    Bitmap.instance.data.send(:[]=, row_index-1, column_index-1, value)
  end

  def draw_vertical_segment value, column, row_from, row_to
    raise ArgumentError.new("rows and columns should be greater than 0") if self.data == []
    raise StandardError if 1 >= column  && column > self.data.column_count || 1 >= row_from && row_from > self.data.row_count || 1 >= row_to && row_to > self.data.row_count
    (row_from..row_to).each {|row| self.data.send(:[]=, row-1, column-1, value) }
  end

  def draw_horizontal_segment value, column_from, column_to, row
    raise ArgumentError.new("rows and columns should be greater than 0") if self.data == []
    raise StandardError if 1 >= column_from  && column_from > self.data.column_count || 1 >= column_to && column_to > self.data.column_count || 1 >= row && row > self.data.row_count
    (column_from..column_to).each {|column| self.data.send(:[]=, row-1, column-1, value) }
  end

  def show
    raise ArgumentError.new("rows and columns should be greater than 0") if self.data == []
    (0...self.data.row_count).each do |i|
      puts self.data.row(i).to_a.join
    end
  end


end