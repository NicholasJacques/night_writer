require './lib/parser'
require './lib/translator'

class NightWrite
    attr_reader
    def initialize(filename = ARGV[0], savename =ARGV[1])
        @filename = filename
        @savename = savename
    end

    def english_to_braille
        
    end
end