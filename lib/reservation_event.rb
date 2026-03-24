class ReservationEvent
  VALID_STATUSES = [
    "confirmed",
    "checked_in",
    "checked_out",
    "do_not_disturb",
    "service_requested"
  ]

  attr_reader :status, :location, :timestamp, :notes

  def initialize(status, location, timestamp, notes = nil)
    unless VALID_STATUSES.include?(status)
      raise ArgumentError, "Invalid status"
    end

    @status = status
    @location = location
    @timestamp = timestamp
    @notes = notes

    freeze
  end

  def to_s
    "[#{timestamp}] #{status} at #{location}"
  end
end
