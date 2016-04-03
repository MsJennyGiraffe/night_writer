require 'minitest/autorun'
require_relative '../lib/converter'

class ConverterTest < Minitest::Test

  def setup
    @converter = Converter.new
  end

  def test_converter_contains_a_hash
    assert_equal Hash, @converter.english_to_braille.class
  end

  def test_converter_

end
