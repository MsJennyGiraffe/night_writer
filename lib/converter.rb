require_relative 'dictionary'
require 'pry'

class Converter

  include Dictionary

  def converting(message)
    translated_message = translate_to_braille(message)
    formatting_characters(translated_message)
  end

  def split_contents(english_message)
    english_message.split("")
  end

  def character_converter(character)
    english_to_braille[(character)]
  end

  def translate_to_braille(message)
    array = []
      split_contents(message).each do |key, value|
      if is_downcase?(key)
        array << english_to_braille[(key)]
      else
        array << insert_capital
        array << upcase_lettering(key)
      end
    end
    array
  end

  def insert_capital
    english_to_braille[("capital")]
  end

  def upcase_lettering(key)
    downcase_key = key.downcase
    english_to_braille[(downcase_key)]
  end

  def formatting_characters(message)
    joins_braille_indices(message, 0) + "\n" +
    joins_braille_indices(message, 1) + "\n" +
    joins_braille_indices(message, 2)
  end

  def joins_braille_indices(braille_message, index)
    braille_message.map do |braille|
      braille[index]
    end.join
  end

  def character_converter_from_braille(braille)
    english_to_braille.key(braille)
  end

  private

  def is_downcase?(character)
    character == character.downcase ? true : false
  end

end
