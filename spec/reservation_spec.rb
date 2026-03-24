require_relative '../lib/reservation'
require_relative '../lib/rooms/standard_room'

RSpec.describe Reservation do
  let(:room) { StandardRoom.new(101, 2) }

  let(:notifier) do
    double("Notifier", notify: nil)
  end

  describe "#initialize" do
    it "creates a reservation with valid inputs" do
      res = Reservation.new("John", room, [notifier])
      expect(res.guest_name).to eq("John")
      expect(res.confirmation_number).to start_with("RES")
    end

    it "raises error if no notifiers provided" do
      expect {
        Reservation.new("John", room, [])
      }.to raise_error(ArgumentError)
    end
  end

  describe "#current_status" do
    it "returns not_yet_confirmed when no events" do
      res = Reservation.new("John", room, [notifier])
      expect(res.current_status).to eq("not_yet_confirmed")
    end
  end

  describe "#update_status" do
    it "adds event and updates status" do
      res = Reservation.new("John", room, [notifier])

      res.update_status("confirmed", "Front Desk", "time")

      expect(res.current_status).to eq("confirmed")
      expect(res.event_history.length).to eq(1)
    end

    it "calls notifier when status updates" do
      res = Reservation.new("John", room, [notifier])

      expect(notifier).to receive(:notify)

      res.update_status("confirmed", "Front Desk", "time")
    end
  end

  describe "#event_history" do
    it "returns all events" do
      res = Reservation.new("John", room, [notifier])

      res.update_status("confirmed", "Front Desk", "time")
      res.update_status("checked_in", "Room", "time")

      expect(res.event_history.length).to eq(2)
    end
  end

  describe "#total_cost" do
    it "delegates cost calculation to room" do
      res = Reservation.new("John", room, [notifier])
      expect(res.total_cost).to eq(160.0)
    end
  end
end
