json.array!(@bookings) do |booking|
  json.extract! booking, :id, :name
  json.url booking_url(booking, format: :json)
end
