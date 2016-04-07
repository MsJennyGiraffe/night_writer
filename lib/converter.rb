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
    braille = []
      split_contents(message).each do |key, value|
        if key =~ /[\d]/
          braille << english_to_braille["number"]
          braille << english_to_braille[key]
        elsif is_downcase?(key)
          braille << english_to_braille[key]
        else
          braille << insert_capital
          braille << upcase_lettering(key)
        end
      end
    braille
  end

  def insert_capital
    english_to_braille["capital"]
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

  def split_braille_contents(braille_message)
    braille_message.map do |braille|
      braille
    end
  end

  def translate_to_english(message)
    english = []
    split_braille_contents(message).each do |braille|
      english << character_converter_from_braille(braille)
    end
    english.join
  end

  private

  def is_downcase?(character)
    character == character.downcase ? true : false
  end

end
