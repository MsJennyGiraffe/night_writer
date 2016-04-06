
class Converter

  attr_reader :english_to_braille

  def initialize
    @english_to_braille = { "a" => [["0."], [".."], [".."]],
                            "b" => [["0."], ["0."], [".."]],
                            "c" => [["00"], [".."], [".."]],
                            "d" => [["00"], [".0"], [".."]],
                            "e" => [["0."], [".0"], [".."]],
                            "f" => [["00"], ["0."], [".."]],
                            "g" => [["00"], ["00"], [".."]],
                            "h" => [["0."], ["00"], [".."]],
                            "i" => [[".0"], ["0."], [".."]],
                            "j" => [[".0"], ["00"], [".."]],
                            "k" => [["0."], [".."], ["0."]],
                            "l" => [["0."], ["0."], ["0."]],
                            "m" => [["00"], [".."], ["0."]],
                            "n" => [["00"], [".0"], ["0."]],
                            "o" => [["0."], [".0"], ["0."]],
                            "p" => [["00"], ["0."], ["0."]],
                            "q" => [["00"], ["00"], ["0."]],
                            "r" => [["0."], ["00"], ["0."]],
                            "s" => [[".0"], ["0."], ["0."]],
                            "t" => [[".0"], ["00"], ["0."]],
                            "u" => [["0."], [".."], ["00"]],
                            "v" => [["0."], ["0."], ["00"]],
                            "w" => [[".0"], ["00"], [".0"]],
                            "x" => [["00"], [".."], ["00"]],
                            "y" => [["00"], [".0"], ["00"]],
                            "z" => [["0."], [".0"], ["00"]],
                            " " => [[".."], [".."], [".."]]
                          }
  end

  def converting(message)
    translated_message = translate_to_braille(message)
    formatting_characters(translated_message)
  end

  def split_contents(english_message)
    english_message.split("")
  end

  #splits content to be translated by character

  def character_converter(character)
    @english_to_braille[(character)]
  end

  #translated a single character to braille

  def character_converter_from_braille(braille)
    @english_to_braille.key(braille)
  end

  def translate_to_braille(message)
    split_contents(message).map do |key, value|
      @english_to_braille[(key)]
    end
  end

  #takes a words and converts it to braille

  def formatting_characters(message)
    joins_first_braille_indices(message) + "\n" +
    joins_second_braille_indices(message) + "\n" +
    joins_third_braille_indices(message)
  end

  #formats braille characters (aligns 0 indexes, 1 indexes and 2 indexes)

  def joins_first_braille_indices(braille_message)
    braille_message.map do |braille|
      braille[0]
    end.join
  end

  def joins_second_braille_indices(braille_message)
    braille_message.map do |braille|
      braille[1]
    end.join
  end

  def joins_third_braille_indices(braille_message)
    braille_message.map do |braille|
      braille[2]
    end.join
  end

end
