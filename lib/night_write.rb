class ReadWrite

    attr_reader :text_input
    attr_accessor :text_out

    def initialize(filename = ARGV[0], savefilename = ARGV[1], text_input = '', text_out = '')
        @filename = filename
        @savefilename = savefilename
        @text_input = text_input
        @text_out = ''
    end

    def file_open
        @text_input = File.open(@filename).read
        @text_input
    end

    def file_write(text_to_write = @text_out)
        braille = File.open(@savefilename, 'w')
        braille.write(text_to_write)
        puts "Created '#{@savefilename}' containing #{text_to_write.length} characters"
    end

end



