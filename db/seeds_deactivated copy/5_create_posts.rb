require "json"
require "faker"
require "geocoder"

POST_PICTURES = Cloudinary::Api.resources(type: "upload", max_results: 500, prefix: "post_seed/")

puts "📸 Creating Post..."
puts "how many posts do you want to create?"
print "➡️"
n_posts = gets.chomp.to_i
puts n_posts

puts "creating #{n_posts} posts..."
post = 0
n_posts.times do
  print post += 1
  rand_latitude = rand(52.4901..52.5130)
  rand_longitude = rand(13.3888..13.4449)
  reverse_geocode = Geocoder.search([rand_latitude, rand_longitude])
  photo_blob = POST_PICTURES["resources"].sample
  file = URI.open(photo_blob["url"])

  new_post = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: User.all.sample.id,
    address: reverse_geocode.first.address,
    latitude: rand_latitude,
    longitude: rand_longitude,
    created_at: Faker::Date.between(from: '2022-01-01', to: '2023-05-10')
  )

  new_post.post_image.attach(io: file, filename: photo_blob["public_id"] , content_type: "image/png")
  new_post.save
  puts "Created post"
end

puts "Created #{Post.count} posts"
