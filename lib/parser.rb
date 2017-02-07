message = "This message will be translated to braille."
require 'pry-state'
require './lib/translator.rb'

class Parser
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

  def split_message_english
    file_open.split(//) 
  end

  def convert_letters_to_braille
    braille_conversions = []
    split_message_english.each do |character|
      
      
    end
    # 
    # this method converts each letter to its braille equivalent
    # and stores the resulting array in a nested array (braille array)
  end


  def format_braille
    # this method will send index 1 of element one in the braille array to a line one array, element 2, line 2, element 3, line 3.
    # [["0.","..",".."], ["0.","0.",".."]]
    #   1     2    3       1     2    3
  end

  def format_braille
    first, second, third   = [], [], []

    convert_letters.each do |letter|
        first   << letter[0]
        second  << letter[1]
        third   << letter[2]
    end
    insert_new_lines(first.join, second.join, third.join)
  end







  def english_to_braille
    translations = {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
     "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
     "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
     "m" => ["00","..","0."], "n" => ["0.",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
     "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."], "u" => ["0.","..","00"],
     "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"], "y" => ["00",".0","00"],
     "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."], "," => ["..","0.",".."],
     "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"], "capitals" => ["..", "..", ".0"],
     "numbers" => [".0", ".0", "00"], " " => ["..","..",".."]}
  end


  def  letters_to_numbers
    { "j" => "0", "a" => "1", "b" => "2", "c" => "3", "d" => "4",
      "e" => "5", "f" => "6", "g" => "7", "h" => "8", "i" => "9"}
  end




end