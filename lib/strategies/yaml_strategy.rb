require 'yaml'
require './lib/strategies/base_strategy'
class YamlStrategy < BaseStrategy
  def parse_file(file_path)
    YAML.load(File.read(file_path))
  end
  
  def parse_string (str)
   YAML.load(str)
  end
end
