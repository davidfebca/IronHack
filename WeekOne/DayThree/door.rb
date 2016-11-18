class Door
  attr_accessor(:id,:name,:location,:id_room)
  def initialize id, name, location, id_room
    @id = id
    @name = name
    @location = location
    @id_room = id_room
  end
end
