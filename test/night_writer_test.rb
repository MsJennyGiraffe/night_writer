require 'minitest/autorun'
require_relative '../lib/night_writer'

class NightWriterTest < Minitest::Test

  def setup
    @night_writer = NightWriter.new
  end

  def test_nightwriter_can_be_instantiated
    assert_equal NightWriter, @night_writer.class
  end

  def test_when_message_is_input_nightwriter_returns_a_message_about_the_output
    files = FileAccessor.new
    files.create_output_file("my_file.txt", "message")
    assert_equal "Created output.txt containing 7 characters", @night_writer.output_file("message")
  end

  def test_nightwriter_can_return_the_number_of_characters_in_the_output_file
    assert_equal 7, @night_writer.count_output_characters
  end

end
