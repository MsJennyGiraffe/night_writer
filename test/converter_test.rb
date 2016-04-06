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

  def test_converter_can_translate_a_different_character
    assert_equal "00.0..", @converter.character_converter("d").join
  end

  def test_converter_can_translate_characters_from_braille
    assert_equal "a", @converter.character_converter_from_braille([["0."], [".."], [".."]])
  end

  def test_converter_can_translate_another_character_from_braille
    assert_equal "z", @converter.character_converter_from_braille([["0."], [".0"], ["00"]])
  end

  def test_converter_can_split_contents_into_an_array
    assert_equal ["h", "i"], @converter.split_contents("hi")
  end

  def test_two_letters_can_be_converted
    assert_equal [[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], @converter.translate_to_braille("hi")
  end

  # def test_letters_can_be_formatted_together
  #   assert_equal "", @converter.formatting_characters([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  # end

  def test_joins_first_braille_indices
    assert_equal "0..0", @converter.joins_first_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  end

  def test_joins_second_braille_indices
    assert_equal "000.", @converter.joins_second_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  end

  def test_joins_third_braille_indices
    assert_equal "....", @converter.joins_third_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  end

end
