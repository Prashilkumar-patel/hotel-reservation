class Room
  attr_reader :room_number, :nights

  def initialize(room_number, nights)
    @room_number = room_number
    @nights = nights
  end

  def total_cost
    raise NotImplementedError, "Subclasses must implement total_cost"
  end

  def description
    "#{self.class}: #{nights} nights in Room #{room_number}"
  end
end
