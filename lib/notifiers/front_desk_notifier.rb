class FrontDeskNotifier
  INSTRUCTIONS = {
    "confirmed" => "New reservation confirmed. Please prepare room assignment.",
    "checked_in" => "Guest has checked in. Notify housekeeping to remove turndown service.",
    "checked_out" => "Guest has checked out. Flag room for housekeeping.",
    "do_not_disturb" => "Do Not Disturb active. Hold all housekeeping visits for this room.",
    "service_requested" => "Guest has requested service. Dispatch nearest available staff member."
  }

  def notify(reservation, event)
    puts "----------------------------------------"
    puts "FRONT DESK ALERT"
    puts "----------------------------------------"
    puts "Reservation : #{reservation.confirmation_number}"
    puts "Status      : #{event.status}"
    puts "Location    : #{event.location}"
    puts "Time        : #{event.timestamp}"

    if event.notes
      puts "Notes       : #{event.notes}"
    end

    puts "----------------------------------------"
    puts INSTRUCTIONS[event.status]
    puts "----------------------------------------"
  end
end
