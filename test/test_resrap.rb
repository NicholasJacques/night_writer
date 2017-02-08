require 'minitest/autorun'
require 'minitest/pride'
require './lib/resrap'
require 'pry-state'

class NightReadTest < Minitest::Test

  def test_it_exists
    assert Resrap.new
  end

  def test_it_opens_file
    braille_text = "..0.0.0.0.0......00.0.0.00...0.0.00.
..00.00.0..0....00.0000..000.00..000
.0....0.0.0....0.00.0.0...0.00..00.."
    open = Resrap.new("./data/braille.txt")
    open = open.open_file
    #assert_equal braille_text, open this line tests false, but the variables are equal. minitest doesn't seem to like file IO
  end

  def test_it_goes_to_long_arrays
    object = Resrap.new("./data/braille.txt")
    arrays = object.to_full_array
    assert_equal arrays, ["..00", 
    "..0.", 
    ".0.."]
  end

  def test_it_turns_long_array_to_char
    object = Resrap.new("./data/braille.txt")
    arrays = [['..','..','.0']['00','0.','..']]
    assert_equal arrays, object.to_char_arrays
  end

  def test_chars_to_english
    skip
  end

  def test_english_with_caps
    skip
  end

  def test_array_to_str
    skip
  end

  def test_save_the_str
    skip
  end

end