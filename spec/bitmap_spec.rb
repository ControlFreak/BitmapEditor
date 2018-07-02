require 'spec_helper'
require './lib/bitmap'
require 'matrix'
require 'pp'

describe Bitmap do

  before :each do
    @bitmap = Bitmap.send(:new)
    @empty_matrix_with_o = Matrix.build(5,6) {"O"}
  end

  describe "#new" do

    it "should get row and column as parameter and return an instance of bitmap" do
      expect(@bitmap).to be_an_instance_of Bitmap
    end

  end

  describe "#data" do

    it "should data as an empty array" do
      expect(@bitmap.data).to eq([])
    end

    it "should return a matrix of size Rows X Columns" do
      @bitmap.add(5,6)
      expect(@bitmap.data).to eq(@empty_matrix_with_o)
    end
  end

  describe "#add" do

    it "should raise an error if 2 arguements are not passed" do
      expect(lambda { Bitmap.instance.add 5}).to raise_exception ArgumentError
    end

    it "should raise an error if rows or columns are less than 1" do
      expect(lambda {Bitmap.instance.add(0, 6)}).to raise_exception ArgumentError
      expect(lambda {Bitmap.instance.add(5, 0)}).to raise_exception ArgumentError
    end

    it "should raise an error if the rows or columns are greater than 250" do
      expect(lambda {Bitmap.instance.add( 256, 6)}).to raise_exception ArgumentError
      expect(lambda {Bitmap.instance.add(5, 300)}).to raise_exception ArgumentError
    end

  end

  describe "#clear" do

    before :each do
      @bitmap = Bitmap.instance
      @bitmap.add(5,6, "I")
    end

    it "should return the same matrix with all elements as zero" do
      @bitmap.clear
      expect(@bitmap.data).to eq @empty_matrix_with_o
    end

    it "should raise exception if data is empty" do

    end

  end

  describe "#set_value_at_index" do

    it "should raise exception if data is empty" do
      bitmap = Singleton.__init__(Bitmap).instance
      expect(lambda {bitmap.set_value_at_index("C", 4, 3)}).to raise_exception ArgumentError
    end

    it "should raise the exception if the index in out of bounds" do
      expect(lambda {Bitmap.instance.set_value_at_index("C", 7, 8) }).to raise_exception StandardError
    end

    it "should return the value at index as provided" do
      @bitmap.add(5,6)
      @bitmap.set_value_at_index("C", 4, 3)
      expect(@bitmap.data.send(:[], 3, 2)).to eq("C")
    end

  end

  describe "#draw_vertical_segment" do

    let (:bitmap) {Singleton.__init__(Bitmap).instance}

    it "should raise exception if the data is empty" do
      expect(lambda {bitmap.draw_vertical_segment("C", 4, 1, 4)}).to raise_exception ArgumentError
    end

    it "should raise exception if either row or column arguements are out of bounds" do
      bitmap.add(5,6)
      expect(lambda {bitmap.draw_vertical_segment("C", 7, 8, 9) }).to raise_exception StandardError
    end

    it "should set the values of rows in column" do
      bitmap.add(5,6)
      bitmap.draw_vertical_segment("C", 4, 1, 4)
      expect(bitmap.data.send(:[], 2, 3)).to eq("C")
    end

  end

  describe "#draw_horizontal_segment" do

    let (:bitmap) {Singleton.__init__(Bitmap).instance}

    it "should raise exception if either row or column arguements are out of bounds" do
      expect(lambda {bitmap.draw_horizontal_segment("C", 4, 1, 4)}).to raise_exception ArgumentError
    end

    it "should raise exception if the data is empty" do
      bitmap.add(5,6)
      expect(lambda {bitmap.draw_horizontal_segment("C", 7, 8, 9) }).to raise_exception StandardError
    end

    it "should set the values of columns in row" do
      bitmap.add(5,6)
      bitmap.draw_horizontal_segment("C", 1, 4, 4)
      expect(bitmap.data.send(:[], 3, 2)).to eq("C")
    end

  end


  describe "#show" do

    let (:bitmap) {Singleton.__init__(Bitmap).instance}

    it "should raise exception if the data is empty" do
      expect(lambda {bitmap.show }).to raise_exception ArgumentError
    end

    # it "should return the matrix" do
    #   bitmap.add(5,6)
    #   expect(bitmap.show).to be_an_instance_of (Bitmap)
    # end

  end

end