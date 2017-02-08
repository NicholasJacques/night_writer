require 'minitest/autorun'
require './lib/night_write'
require 'minitest/pride'
require './lib/parser'
class NightWriteTest < Minitest::Test
  
    def test_file_opens
        message = Parser.new('./lib/message.txt').file_open
        assert_equal File.open('./lib/message.txt').read, message
    end
    def test_file_saves
      message = Parser.new('./lib/message.txt').file_open
      message_object = Parser.new('./lib/message.txt', './lib/braille.txt')
      message_object.file_open
      message_object.text_out = message_object.text_input
      message_object.file_write
      file = File.open('./lib/braille.txt', 'r')
      #assert_equal file.read, message_object.text_input
    end

    def test_split_message
      message = Parser.new('./lib/message.txt')
      assert_equal Array, message.split_message_english.class
    end

    def test_split_english_to_array
      message_object = Parser.new('./lib/message.txt', './lib/braille.txt')
      assert_equal Array, message_object.split_message_english.class
    end

    def test_find_caps
      message_object = Parser.new('./data/single_letter.txt')
      assert_equal message_object.find_caps_and_nums, ["capital","f"]
    end

    def test_find_numbers
      message_object = Parser.new('./data/single_number.txt')
      assert_equal message_object.find_caps_and_nums, ["number","e"]
    end

    def test_english_to_braille_array
      translate_object = Parser.new('./lib/message.txt', './lib/braille.txt')
      assert_equal translate_object.convert_letters_to_braille, [["..", "..", ".0"], ["0.", "00", ".."]]
    end

    def test_english_to_braille_string
      translate_object = Parser.new('./data/short_message.txt', './data/braille.txt')
      assert_equal translate_object.format_braille, '..0.0.0.0.0......00.0.0.00...0.0.00.
..00.00.0..0....00.0000..000.00..000
.0....0.0.0....0.00.0.0...0.00..00..'
    end

    def test_braille_write_to_file
      
      translate_object = Parser.new('./data/short_message.txt', './data/braille.txt')
      translate_object.file_write(translate_object.format_braille)
      file = File.open('./data/braille.txt').read
      assert_equal file,  '..0.0.0.0.0......00.0.0.00...0.0.00.
..00.00.0..0....00.0000..000.00..000
.0....0.0.0....0.00.0.0...0.00..00..'
    end
    def test_text_wrap
      skip
      translate_object = Parser.new('./data/long_message.txt', './data/braille.txt')
      translate_object.file_write(translate_object.format_braille)
      assert_equal translate_object.format_braille, "...00..0.0...0.0..0...000..0.00.000....00.0..0..0.0..0...00..000.0.0..000.0.0.0.
..00000.0...0.0..........00.0...00.0..0000..00..00..0....00..00..000....00..00..
.00.....0.....0.......0...0.0.........0.....0.......0...00..00..00..........0...

00.00.0..0.........00..0.0...0.0..0...000..0.00.000....00.0..0..0.0..0...00..000
..00.0000.000.00..00000.0...0.0..........00.0...00.0..0000..00..00..0....00..00.
..0...0.0..0000..00.....0.....0.......0...0.0.........0.....0.......0...00..00..

.0.0..000.0.0.0.00.00.0..0.........00..0.0...0.0..0...000..0.00.000....00.0..0..
.000....00..00....00.0000.000.00..00000.0...0.0..........00.0...00.0..0000..00..
00..........0.....0...0.0..0000..00.....0.....0.......0...0.0.........0.....0...

0.0..0...00..000.0.0..000.0.0.0.00.00.0..0.........00..0.0...0.0..0...000..0.00.
00..0....00..00..000....00..00....00.0000.000.00..00000.0...0.0..........00.0...
....0...00..00..00..........0.....0...0.0..0000..00.....0.....0.......0...0.0...

000....00.0..0..0.0..0...00..000.0.0..000.0.0.0.00.00.0..0.........00..0.0...0.0
00.0..0000..00..00..0....00..00..000....00..00....00.0000.000.00..00000.0...0.0.
......0.....0.......0...00..00..00..........0.....0...0.0..0000..00.....0.....0.

..0...000..0.00.000....00.0..0..0.0..0...00..000.0.0..000.0.0.0.00.00.0..0......
.........00.0...00.0..0000..00..00..0....00..00..000....00..00....00.0000.000.00
......0...0.0.........0.....0.......0...00..00..00..........0.....0...0.0..0000.

...00..0.0...0.0..0...000..0.00.000....00.0..0..0.0..0...00..000.0.0..000.0.0.0.
..00000.0...0.0..........00.0...00.0..0000..00..00..0....00..00..000....00..00..
.00.....0.....0.......0...0.0.........0.....0.......0...00..00..00..........0...

00.00.
..00.0
..0..."
    end


end