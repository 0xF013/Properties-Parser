require 'yaml'
class YamlParser
  def parse (file_path)
    YAML.load(File.read(file_path))
  end
end
