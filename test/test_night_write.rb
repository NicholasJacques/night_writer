require 'minitest/autorun'
require './lib/night_write'
require 'minitest/pride'

class NightWriteTest < Minitest::Test

    def test_file_IO_object_exists
        file = Brailler.new('message.txt')
        assert Brailler.new('message.txt')
    end

    def test_file_in
        file = Brailler.new('./lib/message.txt')
        assert_equal file.file_open.length, 255
    end

    def test_file_out
        file = Brailler.new('./lib/message.txt', './lib/braille.txt')
        file.file_open
        assert_equal file.text_input.length, 255
        file.file_write(file.text_input)
        test_file_out = File.open('./lib/braille.txt').read
        assert_equal file.text_input, test_file_out 
    end

end