class Brailler

    attr_reader :text_input
    attr_accessor :text_out

    def initialize(filename = ARGV[0], savefilename = ARGV[1])
        @filename = filename
        @savefilename = savefilename
        @text_input = ''
        @text_out = ''
    end

    def file_open(file_to_open = @filename)
        @text_input = File.open(file_to_open).read
        @text_input
    end

    def file_write(string_to_write = @text_out)       
        braille = File.open(@savefilename, 'w')
        braille.write(string_to_write)
        puts "Created '#{@savefilename}' containing #{@text_out.length} characters"
    end

end


