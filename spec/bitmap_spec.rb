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
      expect(@bitmap.data).to eq(Matrix.build(5,6) {"O"})
    end
  end

end