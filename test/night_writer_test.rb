require 'minitest/autorun'
require './lib/night_writer'
require './lib/file_accessor'
require './lib/converter'

class NightWriterTest < Minitest::Test

  def setup
    @night_writer = NightWriter.new
  end

  def test_nightwriter_can_be_instantiated
    assert_equal NightWriter, @night_writer.class
  end

  def test_writes
    @night_writer.start
    assert true
  end

end

class NightWriter
  def initialize
    @file_accessor = FileAccessor.new
    @converter = Converter.new
    @input_file = "message_test.txt"
    @output_file = "output_test.txt"
  end
end
