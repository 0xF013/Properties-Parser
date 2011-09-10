class BaseStrategy
  def parse_file(file_path)
    parse(File.open( file_path, 'r' ))
  end
  
  def parse_string (str)
    parse(str.lines)
  end
end
