require 'minitest/autorun'
require "./lib/file_accessor"

class FileAccessorTest < Minitest::Test

  def setup
    @file_accessor = FileAccessor.new
  end

  def test_file_accessor_can_create_an_output_file_and_fill_its_contents
    @file_accessor.create_output_file("my_file.txt", "this is content", 15)
    assert_equal "this is content", @file_accessor.extract_contents("my_file.txt")
  end

  def test_file_accessor_can_take_contents_from_a_file
    @file_accessor.create_output_file("my_file.txt", "this is content", 15)
    assert_equal "this is content", @file_accessor.extract_contents("my_file.txt")
  end

end
