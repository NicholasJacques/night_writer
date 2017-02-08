require 'minitest/autorun'
require 'minitest/pride'
require './lib/resrap'
require 'pry-state'

class NightReadTest < Minitest::Test

  def test_it_exists
    assert Resrap.new
  end

  def test_it_opens_file
    braille_text = "..00
..0.
.0.."
    open = Resrap.new("./data/braille.txt")
    open = open.open_file
    assert_equal braille_text, open 
  end

  def test_it_goes_to_long_arrays
    object = Resrap.new("./data/braille.txt")
    arrays = object.to_full_array
    assert_equal arrays, ["..00", "..0.", ".0.."]
  end

  def test_it_turns_long_array_to_char
    object = Resrap.new("./data/braille.txt")
    return_arrays = [['..','..','.0'],['00','0.','..']]
    assert_equal return_arrays, object.to_char_arrays
  end

  def test_chars_to_english
    object = Resrap.new("./data/braille.txt")
    return_arrays = ['capital','f']
    assert_equal object.chars_to_english, return_arrays
  end

  def test_english_with_caps
    object = Resrap.new('./data/short_braille.txt')
    return_arrays = ["capital","H", "e", "l", "l", "o", " ", "capital", "W", "o", "r", "l", "d", "!", "number", "i", "number", "h"]
    assert_equal object.capitalize, return_arrays 
  end

  def test_english_with_nums
    object = Resrap.new('./data/short_braille.txt')
    return_arrays = ["capital", "H", "e", "l", "l", "o", " ", "capital", "W", "o", "r", "l", "d", "!", "number", "9", "number", "8"]
    better_return_arrays = ["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d", "!", "9", "8"]
    assert_equal object.convert_to_numbers, return_arrays
    assert_equal object.remove_capital_and_number, better_return_arrays
  end

  def test_array_to_str
    object = Resrap.new('./data/short_braille.txt')
    assert_equal object.array_to_str, "Hello World!98"
  end

  def test_save_the_str
    object = Resrap.new('./data/short_braille.txt')
    object.file_write
    assert_equal File.open('./data/braille_to_english_output', 'r').read, "Hello World!98"
  end

  def test_long_strings
    object = Resrap.new('./data/long_braille.txt')
    object.file_write
  end

end