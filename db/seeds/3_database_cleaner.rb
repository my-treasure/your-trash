puts "🧼 Cleaning database...\n"

tables = [User, Offer, Booking, BookingStatus, Review, Follow, Chatroom, Message, ActiveStorage::Attachment, ActiveStorage::Blob]
# Comment, Followed

tables.each do |table|
  puts "🫧 destroy #{table}: [Y,n]"
  if gets.chomp.downcase == "n"
    puts "💩 you saved #{table}"
  else
  	table.destroy_all
    puts "💥 #{table} destroyed"
  end
end
