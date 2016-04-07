require_relative 'file_accessor'
require_relative 'converter'

class NightWriter

  attr_reader :files

  def initialize
    @file_accessor = FileAccessor.new
    @converter = Converter.new
    @input_file = ARGV[0]
    @output_file = ARGV[1]
  end

  def start
    input = take_input_file
    output = @converter.converting(input)
    length = output.chomp.length
    write_output_file(output, length)
  end

  def take_input_file
    @file_accessor.extract_contents(@input_file)
  end

  def write_output_file(contents, length)
    @file_accessor.create_output_file(@output_file, contents, length)
  end
end

if __FILE__ == $0
nw = NightWriter.new
nw.start
end
