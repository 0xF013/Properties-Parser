require './property_parser'

def error (exception)
  p "Error: the file could not be parsed. Reason:"
  p exception
end

def help
  print " 
You must pass in the path to the file to be parsed.
Usage: #{__FILE__} [format] target_file
The [format] parameter overrides the parsing engine
discovery by extension
" 
end

if ARGV.empty?
  help
  exit
else
  parser = PropertyParser.new
  file_path = ARGV[1] || ARGV[0]
  extension = ARGV[1] || nil
  begin
    
    result = parser.parse(file_path, extension)
    p "Parsing #{file_path}"
    p "Result size: #{result.size}" 
    p "File structure:"
    p result
  rescue Exception => e
    error e
  end
end
