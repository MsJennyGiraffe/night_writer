require 'minitest/autorun'
require './lib/converter'

class ConverterTest < Minitest::Test

  def setup
    @converter = Converter.new
  end

  def test_converter_can_translate_a_single_character
    assert_equal "0.....", @converter.character_converter("a").join
  end

  def test_converter_can_translate_a_different_character
    assert_equal "00.0..", @converter.character_converter("d").join
  end

  def test_converter_can_split_contents_into_an_array
    assert_equal ["h", "i"], @converter.split_contents("hi")
  end

  def test_two_letters_can_be_converted
    assert_equal [[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], @converter.translate_to_braille("hi")
  end

  def test_joins_first_braille_indices
    assert_equal "0..0", @converter.joins_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], 0)
  end

  def test_joins_second_braille_indices
    assert_equal "000.", @converter.joins_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], 1)
  end

  def test_joins_third_braille_indices
    assert_equal "....", @converter.joins_braille_indices([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], 2)
  end

  def test_converter_can_deal_with_capitol_letters
    assert_equal [[[".."], [".."], [".0"]], [["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]], @converter.translate_to_braille("Hi")
  end

  def test_converter_can_handle_multiple_uppercase_letters
    assert_equal [[[".."], [".."], [".0"]], [["0."], ["00"], [".."]], [[".."], [".."], [".0"]], [[".0"], ["0."], [".."]]], @converter.translate_to_braille("HI")
  end

  def test_converter_can_translate_characters_from_braille
    assert_equal "a", @converter.character_converter_from_braille([["0."], [".."], [".."]])
  end

  def test_converter_can_translate_another_character_from_braille
    assert_equal "z", @converter.character_converter_from_braille([["0."], [".0"], ["00"]])
  end

  def test_can_convert_multiple_braille_letters
    assert_equal ["h", "i"], @converter.translate_to_english([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  end

  def test_can_convert_a_sentence
    assert_equal ["h", "i", " ", "y", "o", "u"], @converter.translate_to_english([[["0."], ["00"], [".."]], [[".0"], ["0."], [".."]], [[".."], [".."], [".."]], [["00"], [".0"], ["00"]], [["0."], [".0"], ["0."]], [["0."], [".."], ["00"]]])
  end

  def test_can_convert_capitals_from_braille_to_english
    assert_equal ["H", "i"], @converter.translate_to_english([[[".."], [".."], [".0"]], [["0."], ["00"], [".."]], [[".0"], ["0."], [".."]]])
  end

  def test_can_convert_multiple_capitals_from_braille_to_english
    assert_equal ["H", "I"], @converter.translate_to_english([[[".."], [".."], [".0"]], [["0."], ["00"], [".."]], [[".."], [".."], [".0"]], [[".0"], ["0."], [".."]]])
  end

  def test_can_convert_from_integers_to_braille
    assert_equal [[[".0"], [".0"], ["00"]], [[".0"], ["0."], [".."]]], @converter.translate_to_braille("9")
  end

  def test_can_convert_from_multiple_integers_to_braille
    assert_equal [[[".0"], [".0"], ["00"]], [[".0"], ["0."], [".."]], [[".0"], [".0"], ["00"]], [[".0"], ["00"], [".."]]], @converter.translate_to_braille("90")
  end

  def test_can_convert_exclaimation_mark_to_braille
    assert_equal [[[".."], ["00"], ["0."]]], @converter.translate_to_braille("!")
  end

  def test_can_convert_exclaimation_mark_to_english
    assert_equal ["!"], @converter.translate_to_english([[[".."], ["00"], ["0."]]])
  end

  def test_it_can_also_do_other_punctuation_to_braille
    assert_equal [[[".."], [".."], ["0."]], [[".."], ["00"], [".0"]], [[".."], ["0."], ["00"]], [[".."], [".."], ["00"]]], @converter.translate_to_braille("'.?-")
  end

  def test_it_can_also_do_other_punctuation_to_english
    assert_equal ["'", ".", "?", "-"], @converter.translate_to_english([[[".."], [".."], ["0."]], [[".."], ["00"], [".0"]], [[".."], ["0."], ["00"]], [[".."], [".."], ["00"]]])
  end

  def test_converting_can_tell_the_difference_between_braille_and_english
    assert_equal "0..0\n000.\n....", @converter.converting("hi")
  end

  def test_translate_to_braille_can_detect_numbers
    assert_equal [[[".0"], [".0"], ["00"]], [["0."], [".0"], [".."]]], @converter.translate_to_braille("5")
  end

  def test_translate_to_braille_does_not_turn_newlines_into_nil
    assert_equal [], @converter.translate_to_braille("\n")
  end

  def test_upcase_lettering_lowercases_the_letter_to_comply_with_dictionary
    assert_equal [["0."], ["00"], [".."]], @converter.upcase_lettering("H")
  end

  def test_formatting_characters_aligns_braille_indices
    assert_equal ["..0....0", "..00..0.", ".0...0.."], @converter.formatting_characters([[[".."], [".."], [".0"]], [["0."], ["00"], [".."]], [[".."], [".."], [".0"]], [[".0"], ["0."], [".."]]])
  end

  def test_is_downcase_checks_if_a_letter_is_lowercase
    assert @converter.is_downcase?("k")
  end

  def test_is_downcase_really_checks_if_a_letter_is_lowercase
    refute @converter.is_downcase?("K")
  end

end
