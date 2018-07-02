require 'spec_helper'
require './lib/bitmap_editor'
require 'pp'

describe BitmapEditor do

  before :each do
    @bitmap_editor = BitmapEditor.new
  end

  describe "#run" do

    it "should return with message if file path is not present" do
      file = nil
      expect(@bitmap_editor.run(file)).to eq($stderr.puts "please provide correct file")
    end

    it "should return file if the file path is valid" do
      file = "./examples/show.txt"
      expect(File.open file).to be_instance_of(File)
    end

    it "should return message 'There is no image' if the command is S" do
    end

  end

end