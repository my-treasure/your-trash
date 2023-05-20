Dir.glob(File.join("*", "seeds", "*.rb")).each do |seed|
  puts "\n🌱 Do you wish to run #{seed}: [Y,n]"
  puts "➡️"
  if gets.chomp.downcase == "n"
    puts "🛸 Skipping file\n"
  else
  	load seed
  end
end

puts "\n🌈 Finished!"
