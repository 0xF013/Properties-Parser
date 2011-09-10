require './property_parser'

describe PropertyParser do 
  before :each do
    @parser = PropertyParser.new
  end
  
  it "raises an exception on unreadable or unexisting file" do
    expect {@parser.parse("someunexistingfile.ini")}.to raise_error FileNotAccessible
  end
  
  it "raises an exception on unknown extension" do
    expect {@parser.parse("some_file.some_unknown_extension")}.to raise_error InvalidExtension
  end
  

end
