require_relative 'dictionary'

class Converter

  include Dictionary

  def converting(message)
    if message =~ /[a-zA-Z]/
      translated_message = translate_to_braille(message)
      characters = formatting_characters(translated_message)
      split_characters_by_one_sixty(characters)
    else
      split_message = split_braille_contents(message)
      translated_message = translate_to_english(split_message)
      split_characters_by_eighty(translated_message)
    end
  end

  def split_contents(english_message)
    english_message.split("")
  end

  def character_converter(character)
    english_to_braille[(character)]
  end

  def translate_to_braille(message)
    braille = []
      split_contents(message).each do |key, value|
        if key =~ /[\d]/
          braille << english_to_braille["number"]
          braille << english_to_braille[key]
        elsif key == "\n"
          "\n"
        elsif is_downcase?(key)
          braille << english_to_braille[key]
        else
          braille << english_to_braille["capital"]
          braille << upcase_lettering(key)
        end
      end
    braille
  end

  def upcase_lettering(key)
    downcase_key = key.downcase
    english_to_braille[(downcase_key)]
  end

  def formatting_characters(message)
    [joins_braille_indices(message, 0),
    joins_braille_indices(message, 1),
    joins_braille_indices(message, 2)]
  end

  def joins_braille_indices(braille_message, index)
    braille_message.map do |braille|
      braille[index]
    end.join
  end

  def character_converter_from_braille(braille)
    english_to_braille.key(braille)
  end

  def split_braille_contents(braille_message)
    arrays = braille_message.split("\n").map { |string| string.chars }
    new_array = arrays[0].map.with_index do |char, index|
      if index.even?
        [["#{char}#{arrays[0][index + 1]}"], ["#{arrays[1][index]}#{arrays[1][index + 1]}"], ["#{arrays[2][index]}#{arrays[2][index + 1]}"]]
      end
    end.compact
  end

  def converting_to_english(message)
    english = []
    message.each do |braille|
      english << character_converter_from_braille(braille)
    end
    english
  end

  def translate_to_english(message)
    english = []
    is_capital = false
    is_number = false
    converting_to_english(message).each do |letter|
      if letter == "capital"
        is_capital = true
      elsif letter == "number"
        is_number = true
      else
        if is_capital == true
          is_capital = false
          english << letter.upcase
        elsif is_number == true
          is_number = false
          english << letters_to_numbers[letter]
        else
          english << letter
        end
      end
    end
    english = english.join("").gsub("\n", "").split("")
  end

  def split_characters_by_one_sixty(braille)
    braille.each do |characters|
      if characters.length > 161
        braille << characters.slice!(160..-1)
      end
    end
    braille.join("\n")
  end

  def split_characters_by_eighty(english)
    english.each_with_index do |characters, index|
      english.insert(index, "\n")if index % 80 == 0
    end.join("")
  end

  private

  def is_downcase?(character)
    character == character.downcase ? true : false
  end

end
