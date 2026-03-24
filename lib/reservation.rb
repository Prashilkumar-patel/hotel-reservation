require_relative 'reservation_event'

class Reservation
  attr_reader :guest_name, :confirmation_number

  def initialize(guest_name, room, notifiers)
    raise ArgumentError, "At least one notifier is required" if notifiers.empty?

    @guest_name = guest_name
    @room = room
    @notifiers = notifiers
    @events = []
    @confirmation_number = generate_confirmation_number
  end

  private

  def generate_confirmation_number
    "RES#{Time.now.to_i}#{rand(1000..9999)}"
  end
end
