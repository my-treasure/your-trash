require "faker"

puts "💌 creating reviews for completed offers"

completed_bookings = Booking.includes(:booking_status).where(booking_statuses: { completed: true })


puts "Populating user reviews..."
reviews = 0
completed_bookings.each do |booking|
  puts reviews += 2
  # offering person review
  Review.create(
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph(sentence_count: 2),
    booking_id: booking.id,
    reviewer_id: booking.offer.user.id,
    reviewee_id: booking.user.id
  )
  # booking person review
  Review.create(
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph(sentence_count: 2),
    booking_id: booking.id,
    reviewer_id: booking.user.id,
    reviewee_id: booking.offer.user.id
  )
end


# user_ids = users.map { |user| user.id }.shuffle #array of all user ids
# user_ids_b = user_ids
# user_ids_b << user_ids_b.shift
