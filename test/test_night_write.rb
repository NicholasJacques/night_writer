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
        file = Brailler.new('./lib/message.txt')
        file.file_open
        file.file_write
    end

end