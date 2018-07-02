# This is the Bitmap class which gives an instance of bitmap.
# Multiple operations can be performed on the instance of this class

require 'matrix'
require 'singleton'

class Bitmap
  include Singleton

  attr_accessor :data

  def initialize
    @data = []
  end

  # This method adds data in Bitmap instance with character as "O", data is a matrix of "O"
  def add(rows, columns, character="O")
    raise ArgumentError.new("rows and columns should be greater than 0") if rows < 1 || columns < 1
    raise ArgumentError.new("rows and columns should be less than or equal to 250") if rows > 250 || columns > 250
    # TODO : to change the size of the bitmap(matrix) by calling this method multiple times comment the following line.
    raise ArgumentError.new("rows and columns should be less than or equal to 250") if self.data.is_a?(Matrix) && (rows > self.data.row_count || columns > self.data.column_count)
    @data = Matrix.build(rows, columns) {character}
  end

  # This method set all the elements in bitmap as "O"
  def clear
    raise ArgumentError.new("There is no image") if self.data == []
    @data = Matrix.build(self.data.row_count, self.data.column_count) {"O"}
  end

  # This method sets the values of an element at index i and j
  def set_value_at_index value, row_index, column_index
    raise ArgumentError.new("There is no image") if self.data == []
    raise ArgumentError.new("column or row out of bound") if 1 > row_index || row_index > self.data.row_count || 1 > column_index || column_index > self.data.column_count
    Bitmap.instance.data.send(:[]=, row_index-1, column_index-1, value)
  end


  # this method changes the elements in a column
  def draw_vertical_segment value, column, row_from, row_to
    raise ArgumentError.new("There is no image") if self.data == []
    raise ArgumentError.new("column or row out of bound") if 1 > column || column > self.data.column_count || 1 > row_from || row_from > self.data.row_count || 1 > row_to || row_to > self.data.row_count
    (row_from..row_to).each {|row| self.data.send(:[]=, row-1, column-1, value)}
  end

  # this method changes the elements in a row
  def draw_horizontal_segment value, column_from, column_to, row
    raise ArgumentError.new("There is no image") if self.data == []
    raise ArgumentError.new("column or row out of bound") if 1 > column_from || column_from > self.data.column_count || 1 > column_to || column_to > self.data.column_count || 1 > row || row > self.data.row_count
    (column_from..column_to).each {|column| self.data.send(:[]=, row-1, column-1, value)}
  end

  # this method displays the bitmap
  def show
    raise ArgumentError.new("There is no image") if self.data == []
    (0...self.data.row_count).each do |i|
      puts self.data.row(i).to_a.join
    end
  end


end