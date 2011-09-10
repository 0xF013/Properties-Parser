class Item

  def initialize (data)
      @initial_data = data
      @values = {}
      data.each do |k, v|
        if v.instance_of? Hash
          @values[k] = Item.new(v)
        else
          @values[k] = v
        end
      end
  end
  
  def get (key)
    raise ItemKeyNotPresent unless @values.key?(key)
    @values[key]
  end
  
  def [](key)
    get(key)
  end  
  
  def to_s
    PP::pp(@initial_data, '')
  end
  
  def size
    @values.size
  end

end
