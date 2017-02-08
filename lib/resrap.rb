require 'pry-state'
require './lib/translator'
class Resrap

  def initialize(filename = "", savefilename = './data/braille_to_english_output')
    @filename = filename
    @numbers_hash = { "j" => "0", "a" => "1", "b" => "2", "c" => "3", "d" => "4",
      "e" => "5", "f" => "6", "g" => "7", "h" => "8", "i" => "9"}
    @savefilename = savefilename
  end

  def open_file
    File.open(@filename).read
  end

  def to_full_array
    array = open_file.split("\n")
    while array.length > 3 
      array[0] += array[3]
      array.slice!(3)
      array[1] += array[3]
      array.slice!(3)
      array[2] += array[3]
      array.slice!(3)
    end
    array
  end

  def to_char_arrays
    char_arrays = []
    (to_full_array[0].length/2).times do |i|
      subarr = []
      3.times do |loop|
        subarr << to_full_array[loop][(i*2)..(i*2+1)]
      end
      char_arrays << subarr
    end
    char_arrays
  end

  def chars_to_english
    englisher = Translator.new([], to_char_arrays)
    englisher.braille_to_english_translator
  end

  def capitalize
    capped_arr = chars_to_english
    chars_to_english.map.with_index do |char, index|
      if char == "capital"
        capped_arr[index+1] = capped_arr[index + 1].upcase
      end
    end
    capped_arr
    
  end

  def convert_to_numbers
    nummed_arr = capitalize
    capitalize.map.with_index do |char, index|
      if char == "number"
        nummed_arr[index+1] = @numbers_hash[nummed_arr[index+1]]
      end
    end
    nummed_arr
  end


  def remove_capital_and_number
    decapped_arr = convert_to_numbers.reject do |character|
      character == "capital" or
      character == "number"
    end
    decapped_arr
  end

  def array_to_str
    remove_capital_and_number.join('')
  end

  def file_write
      english = File.open(@savefilename, 'w')
      english.write(array_to_str)
      puts "Created '#{@savefilename}' containing #{array_to_str.length} characters"
  end

end
