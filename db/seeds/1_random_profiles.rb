require 'httparty'

search_topics = %w[cats funny eating]

puts "😺 1. downloading some profile pictures"
images_urls = []
search_topics.each do |topic|
  search_results = Unsplash::Photo.search(topic)
  search_results.each do |photo|
    images_urls << photo.urls.thumb
  end
end

uploading = 0
images_urls.each do |url|
  url_split = url.split("?")
  Cloudinary::Uploader.upload(url, public_id: "profile_pictures/#{File.basename(url_split.first)}")
  filename = File.join(Rails.root, "app", "assets", "images", "profile_pictures", File.basename(url_split.first))
  File.open(filename, "wb") do |file|
    response = HTTParty.get(url)
    file.write response.body
  end
  puts "uploaded #{File.basename(url_split.first)}"
  uploading += 1
  sleep(5)
end

puts "📤 2. uploaded #{uploading} images to cloudinary, and saved in images folder"
