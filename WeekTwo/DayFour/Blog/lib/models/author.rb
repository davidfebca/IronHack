class Author
  attr_reader :id
  attr_accessor :name
  def initialize  id,name
    @id = id
    @name = name
  end
  def get_name
    @name
  end
end
