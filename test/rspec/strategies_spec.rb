require './property_parser'

describe INIStrategy do 
  before :each do
    @strategy = INIStrategy.new
  end
  
  it "raises an exception when sections are missing" do
    lines = [ "a=b\n", "d=c\n" ] #no [section1] here
     expect {@strategy.parse(lines)}.to raise_error IniFileSectionUndefined
  end

end


describe PropertiesStrategy do 
  before :each do
    @strategy = PropertiesStrategy.new
  end
  
  it "omits the commented lines (that start with #)" do
    lines = [ "a=b\n", "g=c\n", "#d=e\n" ] 
    @strategy.parse(lines).should_not include("d")
  end

end
