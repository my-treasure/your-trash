# require 'inquirer'

# list_seeds = Dir[File.join(Rails.root, "db", "seeds", "*.rb")]

# idx = Ask.list "Select a seed file to run:", list_seeds
# puts "You selected: #{list_seeds[idx]}"

# load list_seeds[idx]

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
