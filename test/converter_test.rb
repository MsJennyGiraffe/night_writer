require 'minitest/autorun'
require './lib/converter'

class ConverterTest < Minitest::Test

  def setup
    @converter = Converter.new
  end

  def test_converter_contains_a_hash
    assert_equal Hash, @converter.english_to_braille.class
  end

  def test_converter_can_translate_a_single_character
    assert_equal "0.....", @converter.character_converter("a").join
  end

end
