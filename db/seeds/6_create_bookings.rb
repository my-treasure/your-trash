puts "🥒 select the number of bookings"
print "👉 "
n_bookings = gets.chomp.to_i

#randomize user_id
users = User.where(role: "seed") #array of all seed users
user_ids = users.map { |user| user.id } #array of all user ids
unbooked_offers = Offer.where.not(id: Booking.select(:offer_id)) #array of all offer ids


puts "Populating user bookings..."
bookings = 0

unbooked_offers.each_with_index do |unbooked_offer, index|
  puts bookings += 1
  break if index >= n_bookings
  Booking.create(
    user_id: user_ids.excluding(unbooked_offer.user.id).sample,
    offer_id: unbooked_offer.id,
    pick_up_time: ["mornings", "afternoons", "evenings"].sample
  )
end


puts "Setting booking statuses..."
bookings = Booking.where.not(id: BookingStatus.select(:booking_id))

bookings.each do |booking|
  accepted = [true, false].sample
  completed = accepted ? [true, false].sample : false
  BookingStatus.create(
    booking_id: booking.id,
    accepted: accepted,
    completed: completed
  )
end
