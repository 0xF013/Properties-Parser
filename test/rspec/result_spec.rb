require './property_parser'

describe Result do

  before :each do
    @result = Result.new ({
      "a" => "b",
      "c" => "d",
      "e" => {
        "f" => "g"
      }
    })
  end
  
  it "returns the count of first level elements in the file as size" do
    @result.size.should eql(3)
  end
  
  

end
