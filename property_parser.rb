require 'format_parsers/ini_parser'
require 'format_parsers/yaml_parser'
require 'format_parsers/properties_parser'
require 'pp'

class PropertyParser
  
  def parse (file_path, extension = nil)
    extension ||= File.extname(file_path)[1..-1].downcase
    p "Parsing #{file_path}, #{extension}"
    if parsers.key? extension
      result = parsers[extension].parse(file_path)
      p "File structure:"
      PP::pp result
    else
      raise "invalid extension: #{extension}"
    end 
  end
  
  private
    def parsers
      {
        "ini" => INIParser.new,
        "yml" => YamlParser.new,
        "properties" => PropertiesParser.new
      }
    end
  
  
end

def error
  print " 
Error: the file could not be parsed
" 
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
  begin
    if ARGV.length == 2
      parser.parse(ARGV[1], ARGV[0])
    else
      parser.parse(ARGV[0])
    end
  rescue
    error
  end
end
