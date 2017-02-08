require './lib/parser'
require './lib/translator'
require './lib/resrap'

class NightRead
    
    def initialize(filename = ARGV[0], savename =ARGV[1])
        @filename = filename
        @savename = savename
    end

    def braille_to_english
        translation = Resrap.new(@filename, @savename)
        translation.file_write
    end
end

NightRead.new.braille_to_english