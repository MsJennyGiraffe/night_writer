
require_relative 'file_accessor'
require_relative 'converter'

class NightWriter

  attr_reader :files

  def initialize
    @file = FileAccessor.new
    #call this file_accessor
  end

  def start
    input = @file.extract_contents(ARGV[0])
    length = input.chomp.length
    converter = Converter.new
    output = converter.converting(input)
    output_file(output, length)
  end

  def output_file(contents, length)
    @file.create_output_file(ARGV[1], contents, length)
  end

  def get_contents_from_converter
    converter = Converter.new
    output_file(converter.converting)
  end

end

nw = NightWriter.new
nw.start
