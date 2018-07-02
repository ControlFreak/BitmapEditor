class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
        when 'S'
          puts "There is no image"
        when "C"
          puts "Command is C"
        when /^I \d{1,3} \d{1,3}$/
          puts "Command is I"
        when /^L \d{1,3} \d{1,3} [A-Z]$/
          puts "Command is L"
        when /^V \d{1,3} \d{1,3} \d{1,3} [A-Z]$/
          puts "Command is V"
        when /^H \d{1,3} \d{1,3} \d{1,3} [A-Z]$/
          puts "Command is H"
        else
          puts 'unrecognised command :('
      end
    end
  end
end
