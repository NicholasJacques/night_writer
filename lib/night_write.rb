require './lib/parser'
require './lib/translator'

class NightWrite
    
    def initialize(filename = ARGV[0], savename =ARGV[1])
        @filename = filename
        @savename = savename
    end

    def english_to_braille
        translation = Parser.new(@filename, @savename)
        translation.file_write(translation.format_braille)
    end
end

NightWrite.new.english_to_braille