class Brailler
    def initialize(filename = ARGV[0], savefilename = ARGV[1])
        @filename = filename
        @savefilename = savefilename
    end

    def file_in
        english_input = File.open(@filename).read
        puts english_input
        
    end

end

