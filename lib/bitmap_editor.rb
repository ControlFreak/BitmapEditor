require './lib/bitmap'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    @bitmap = Bitmap.instance

    File.open(file).each do |line|
      line = line.chomp
      case line
        when 'S'
          @bitmap.show rescue puts "There is no image"
        when "C"
          begin
            @bitmap.clear
          rescue Exception => e
            puts e.message
          end
        when /^I \d{1,3} \d{1,3}$/
          begin
            arry = line.split(" ")
            @bitmap.add(arry[2].to_i, arry[1].to_i)
          rescue Exception => e
            puts e.message
          end
        when /^L \d{1,3} \d{1,3} [A-Z]$/
          begin
            arry = line.split(" ")
            @bitmap.set_value_at_index(arry[3], arry[2].to_i, arry[1].to_i)
          rescue Exception => e
            puts e.message
          end
        when /^V \d{1,3} \d{1,3} \d{1,3} [A-Z]$/
          begin
            arry = line.split(" ")
            @bitmap.draw_vertical_segment(arry[4], arry[1].to_i, arry[2].to_i, arry[3].to_i)
          rescue Exception => e
            puts e.message
          end
        when /^H \d{1,3} \d{1,3} \d{1,3} [A-Z]$/
          begin
            arry = line.split(" ")
            @bitmap.draw_horizontal_segment(arry[4], arry[1].to_i, arry[2].to_i, arry[3].to_i)
          rescue Exception => e
            puts e.message
          end
        else
          puts 'unrecognised command :('
      end
    end
  end
end
