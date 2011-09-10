class InvalidExtension < RuntimeError
end

class FileNotAccessible < RuntimeError 
end

class ItemKeyNotPresent < RuntimeError 
end

class WrongFormatError < RuntimeError
end

class IniFileSectionUndefined < WrongFormatError
end
