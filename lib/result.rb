require './lib/item'

class Result
  
  
  def initialize(data)
    @items = Item.new(data)
  end
  
  def size
    @items.size
  end
  
  def items
    @items
  end
  
  def to_s
    @items.to_s
  end
  
  
end
