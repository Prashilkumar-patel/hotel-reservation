require_relative '../lib/rooms/suite_room'
require_relative '../lib/reservation'
require_relative '../lib/notifiers/text_notifier'
require_relative '../lib/notifiers/email_notifier'
require_relative '../lib/notifiers/front_desk_notifier'

puts "=== Hotel Reservation Management System Demo ==="
puts

puts "Creating room..."
room = SuiteRoom.new(204, 3)
puts room.description
puts

puts "Estimated stay cost: $#{room.total_cost}"
puts

puts "Creating reservation with all notifiers..."
text = TextNotifier.new("555-0192")
email = EmailNotifier.new("carol@example.com")
front = FrontDeskNotifier.new

reservation = Reservation.new("Carol", room, [text, email, front])

puts "Reservation created: #{reservation.confirmation_number} (Guest: Carol)"
puts

puts "Tracking guest journey..."
puts

puts "--- confirmed ---"
reservation.update_status("confirmed", "Front Desk", "2025-06-15 14:00:00")
puts

puts "--- checked_in ---"
reservation.update_status("checked_in", "Room 204", "2025-06-15 15:30:00")
puts

puts "Current status: #{reservation.current_status}"
puts "Total events: #{reservation.event_history.length}"
puts

puts "Demo complete!"
