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
      puts "Created '#{@savefilename}' containing #{@text_input.length} characters"
  end

  def split_message_english
    file_open.split(//) 
  end

  def find_caps_and_nums
    counter = 0
    array_of_parsed_english = split_message_english

    while counter < array_of_parsed_english.length
      if array_of_parsed_english[counter] == array_of_parsed_english[counter].upcase and array_of_parsed_english[counter]  =~ /[A-Za-z]/ #checks to see if capital
        array_of_parsed_english.insert(counter , "capital")
        counter += 2
      elsif array_of_parsed_english[counter] =~ /\A\d+\z/ #if character is a number
        array_of_parsed_english.insert(counter, "number")
        counter += 1
        array_of_parsed_english[counter] = convert_number(array_of_parsed_english[counter])
        counter += 1
      else
        counter += 1
      end
    end
    array_of_parsed_english.each {|thing| thing.downcase!}
    array_of_parsed_english 
  end

  def convert_letters_to_braille
    english_to_braille = Translator.new(find_caps_and_nums)
    english_to_braille.english_to_braille_translator
  end

  def convert_number(number)
    letter_equivalent = ""
    number = number.to_i
    if number == 1
      letter_equivalent = "a"
    elsif number == 2
      letter_equivalent = "b"
    elsif number == 3
      letter_equivalent = "c"
    elsif number == 4
      letter_equivalent = "d"
    elsif number == 5
      letter_equivalent = "e"
    elsif number == 6
      letter_equivalent = "f"
    elsif number == 7
      letter_equivalent = "g"
    elsif number == 8
      letter_equivalent = "h"
    elsif number == 9
      letter_equivalent = "i"
    elsif number == 0
      letter_equivalent = "j"
    end
    letter_equivalent
  end

  def format_braille
    first, second, third   = [], [], []

    convert_letters_to_braille.each do |letter|
        first   << letter[0]
        second  << letter[1]
        third   << letter[2]
    end
    
    if first.length > 40
      format_braille_lines(first, second, third)
    else
      add_lines(first, second, third)
    end
    @text_out
  end

  def add_lines(first, second, third)
    @text_out += first[0..39].join("") + "\n" + second[0..39].join("") + "\n" + third[0..39].join("") + "\n" 
  end

  def format_braille_lines(first, second, third)
    add_lines(first, second, third)
    top = first[40..-1]
    middle = second[40..-1]
    bottom = third[40..-1]
    
    if top.length > 40
      format_braille_lines(top, middle, bottom)
    else
      add_lines(top, middle, bottom)
    end
  end

end