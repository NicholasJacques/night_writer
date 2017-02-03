require 'minitest/autorun'
require './lib/night_write'
require 'minitest/pride'

class NightWriteTest < Minitest::Test
    def test_file_IO_object_exists
        file = Brailler.new('message.txt')
        assert Brailler.new('message.txt')
    end
    def test_file_in_out
        file = Brailler.new('./lib/message.txt')
        file.file_in
    end
end