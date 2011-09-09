require 'lib/inifile'

class INIParser
  def parse(file_path)
    file = IniFile.new(file_path)
    result = Hash::new
    file.sections do |section|
      result[section] = file[section]
    end
    result
  end
end
