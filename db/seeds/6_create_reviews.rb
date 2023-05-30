puts "how many reviews do you want to create?"
print "➡️"
n_reviews = gets.chomp.to_i
puts n_reviews

#randomize user_id
users = User.all #array of all users
user_ids = users.map { |user| user.id } #array of all user ids

#randomize booking_id


puts "creating #{n_reviews} offers..."
reviews = 0
n_reviews.times do
  print reviews += 1
