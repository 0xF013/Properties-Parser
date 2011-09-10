#!/usr/bin/ruby -rubygems
require './lib/strategies/ini_strategy'
require './lib/strategies/yaml_strategy'
require './lib/strategies/properties_strategy'

require './lib/exceptions/'
require './lib/result/'

require 'pp'

class PropertyParser
  
  def initialize
    @parsers = {
        "ini" => INIStrategy.new,
        "yml" => YamlStrategy.new,
        "properties" => PropertiesStrategy.new
      }
  end
  
  
  def parse (file_path, extension = nil)
    extension ||= get_extension_from_path(file_path)
    result = nil
    if is_valid_extension(extension)
      begin
        result = get_result(file_path, extension)
      rescue WrongFormatError => e
        raise e
      rescue StandardError
        raise FileNotAccessible.new file_path
      end
    else
      raise InvalidExtension.new extension
    end 
    result
  end
  
  
  private
  
    def is_valid_extension (extension) 
      @parsers.key?(extension)
    end
    
    def get_extension_from_path (file_path)
      File.extname(file_path)[1..-1].downcase
    end
    
    def get_result (file_path, extension)
      Result.new(@parsers[extension].parse_file(file_path))
    end
  
end
