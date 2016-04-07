require 'minitest/autorun'
require './lib/night_writer'
require './lib/file_accessor'
require './lib/converter'

class NightWriterTest < Minitest::Test

  def setup
    @night_writer = NightWriter.new
  end

  def test_night_writer_can_be_created
    assert_equal NightWriter, @night_writer.class
  end

  def test_night_writer_can_take_input
    assert_equal "this is content", @night_writer.take_input_file
  end

  def test_night_writer_can_give_output
    @night_writer.write_output_file(@output_file, 15)
    assert_equal "this is content", @night_writer.take_input_file
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
