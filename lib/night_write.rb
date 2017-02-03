class Brailler
    def initialize(filename = ARGV[0], savefilename = ARGV[1])
        @filename = filename
        @savefilename = './lib/braille.txt'
        @english_input = ''
        @braille_out = ''
    end

    def file_open
        @english_input = File.open(@filename).read
        @english_input
    end

    def file_write
        
        braille = File.open(@savefilename, 'w')
        braille.write(@english_input)
    end

    def parse_to_translator
        @english_input 
    end
end

