require 'spec_helper'

describe Bitmap do

  before :each do
    @bitmap = Bitmap.new 5, 6
  end

  describe "#new" do
    it "should get row and column as parameter and return an instance of bitmap" do
      @bitmap.should be_an_instance_of Bitmap
    end

    it "should raise an error if 2 arguements are not passed" do

    end

  end

end