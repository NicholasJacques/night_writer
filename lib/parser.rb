class Parser

  def initialize(input)
    @input = input
  end

  def input_message
    @input
  end

  def split_message
    input_message.chars
    # characters = []
    # characters << message.split(//)
  end

  def convert_letters
    braille_conversions = []
    split_message.each do |character|
      braille_conversions << translations[character]
    end
    braille_conversions
    #characters.each do |character|
      #braille_array << translations[character]
    #end
  end

  def format_braille
    first, second, third   = [], [], []

    braille_conversions.each do |letter|
        first   << letter[0]
        second  << letter[1]
        third   << letter[2]
    end
    first.join, second.join, third.join)
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

end

