
require_relative 'file_accessor'
require_relative 'converter'

class NightWriter

  attr_reader :files

  def initialize
    @file_accessor = FileAccessor.new
    @converter = Converter.new
  end

  def start
    input = input_file
    length = input.chomp.length
    output = @converter.converting(input)
    output_file(output, length)
  end

  def input_file
    @file_accessor.extract_contents(ARGV[0])
  end

  def output_file(contents, length)
    @file_accessor.create_output_file(ARGV[1], contents, length)
  end
end

nw = NightWriter.new
nw.start
