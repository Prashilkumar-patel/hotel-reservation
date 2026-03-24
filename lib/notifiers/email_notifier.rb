class EmailNotifier
  MESSAGES = {
    "confirmed" => {
      subject: "Reservation Confirmed — %<confirmation_number>s",
      opening: "We're pleased to confirm your upcoming reservation."
    },
    "checked_in" => {
      subject: "Welcome to Grand Hotel!",
      opening: "Your room is ready. We hope you enjoy every moment of your stay."
    },
    "checked_out" => {
      subject: "Thank you for staying with us",
      opening: "We hope you had a wonderful stay. Your visit means a lot to us."
    },
    "do_not_disturb" => {
      subject: "Do Not Disturb Activated",
      opening: "Your Do Not Disturb preference has been recorded."
    },
    "service_requested" => {
      subject: "Service Request Received",
      opening: "Thank you for reaching out. Our team will be with you shortly."
    }
  }

  def initialize(guest_email)
    @guest_email = guest_email
  end

  def notify(reservation, event)
    config = MESSAGES[event.status]

    subject = if event.status == "confirmed"
      format(config[:subject], confirmation_number: reservation.confirmation_number)
    else
      config[:subject]
    end

    puts "[Email to #{@guest_email}]:"
    puts "Subject: #{subject}"
    puts
    puts config[:opening]
    puts
    puts "Status   : #{event.status}"
    puts "Location : #{event.location}"
    puts "Time     : #{event.timestamp}"

    if event.notes
      puts "Notes    : #{event.notes}"
    end

    puts "---"
  end
end
