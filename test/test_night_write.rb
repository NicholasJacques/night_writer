require 'minitest/autorun'
require './lib/night_write'
require 'minitest/pride'

class NightWriteTest < Minitest::Test

    def test_file_IO_object_exists
        file = ReadWrite.new('message.txt')
        assert ReadWrite.new('message.txt')
    end

    def test_file_in
        file = ReadWrite.new('./lib/message.txt')
        assert_equal file.file_open.length, 255
    end

    def test_file_out
        file = ReadWrite.new('./lib/message.txt', './lib/braille.txt')
        file.file_open
        assert_equal file.text_input.length, 255
        file.file_write(file.text_input)
        test_file = File.open('./lib/braille.txt', 'r').read
        puts test_file
    end

end