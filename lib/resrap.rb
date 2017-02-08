class Resrap

  def initialize(filename = "")
    @filename = filename
  end

  def open_file
    File.open(@filename).read
  end

  def to_full_array
    open_file.split("\n")
  end

  def to_char_arrays
    to_full_array.each do |line|
      char_array = line.each_slice(3)
    end
    char_array
  end

end
