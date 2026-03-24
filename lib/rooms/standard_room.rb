require_relative 'room'

class StandardRoom < Room
  BASE_RATE = 80.00
  RATE_PER_NIGHT = 40.00

  def initialize(room_number, nights)
    super(room_number, nights)
  end

  def total_cost
    BASE_RATE + (nights * RATE_PER_NIGHT)
  end
end
