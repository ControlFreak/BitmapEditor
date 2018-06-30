require 'matrix'
require 'singleton'
class Bitmap
  include Singleton

  attr_accessor :data

  def initialize
    @data = {}
  end



end