require 'minitest/autorun'
#require './lib/night_write'
require 'minitest/pride'
require './lib/parser'
class NightWriteTest < Minitest::Test
  
    def test_file_opens
        message = Parser.new('./lib/message.txt').file_open
        assert_equal File.open('./lib/message.txt').read, message
        puts message
    end
    def test_file_saves
      message = Parser.new('./lib/message.txt').file_open
      message_object = Parser.new('./lib/message.txt', './lib/braille.txt')
      message_object.file_open
      message_object.text_out = message_object.text_input
      message_object.file_write
      #assert_equal File.open('./lib/braille.txt').read, message_object.text_input
    end

    def test_split_english_to_array
      message_object = Parser.new('./lib/message.txt', './lib/braille.txt')
      assert_equal Array, message_object.split_message_english.class
    end

    def test_english_to_braille_array
      od
    end
end