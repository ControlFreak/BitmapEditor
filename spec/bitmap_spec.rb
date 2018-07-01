require 'spec_helper'
require './lib/bitmap'
require 'matrix'

describe Bitmap do

  before :each do
    @bitmap = Bitmap.send(:new)
  end

  describe "#new" do

    it "should get row and column as parameter and return an instance of bitmap" do
      expect(@bitmap).to be_an_instance_of Bitmap
    end

  end

  describe "#data" do

    it "should return a matrix of size Rows X Columns" do
      expect(@bitmap.data).to eq({})
    end

    it "should return a matrix of size Rows X Columns" do
      @bitmap.add(5,6)
      expect(@bitmap.data).to eq(Array.new( 5, Array.new(6, 0) ))
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

  describe


end