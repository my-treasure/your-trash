require "cloudinary"
require "cloudinary/uploader"
require "cloudinary/utils"


# -------------------------------------------- #
# checks if the images in assets already exist in cloudinary
puts "💫 1. Getting ready to upload images to cloudinary..."
ALL_IMAGES = Cloudinary::Api.resources(type: "upload", max_results: 500)

# correcting image names replace "-", "(", ")" with "_"
def rename_image(filename)
  new_filename = filename.gsub(/[()]/, "_") # replace ( or ) with _
  changed = 0
  if new_filename != filename
    File.rename(
      File.join( Rails.root, filename ),
      File.join( Rails.root, new_filename )
    ) # rename the file
    puts "Renamed #{File.basename(filename)} to #{File.basename(new_filename)}"
    changed += 1
  end
  return new_filename, changed
end

def upload_image(subfolder, new_filename)
  exists = 0
  not_exists = 0
  if ALL_IMAGES["resources"].any? { |image| image["public_id"] == "#{subfolder}/#{File.basename(new_filename)}" }
    exists += 1
    puts "#{subfolder}/#{File.basename(new_filename)} already exists in cloudinary"
  else
    Cloudinary::Uploader.upload File.join(
      Rails.root,
      new_filename
      ), public_id: "#{subfolder}/#{File.basename(new_filename).split(".").first}"
    puts "#{subfolder}/#{File.basename(new_filename)} uploaded to cloudinary"
    not_exists += 1
  end
  return exists, not_exists
end

changed_files = 0
files_already_in_cloudinary = 0
files_uploaded = 0

Dir.glob(File.join("**", "app", "assets", "images", "*", "*.*")).each do |filename|
  image = File.basename(filename)
  subfolder = File.dirname(filename).split("/").last
  new_filename, changed = rename_image(filename)
  exist, not_exists = upload_image(subfolder, new_filename)
  changed_files += changed
  files_already_in_cloudinary += exist
  files_uploaded += not_exists
end

puts "📝 2. number of renamed files: #{changed_files}"
puts "☁️ 3. files already in cloudinary: #{files_already_in_cloudinary}"
puts "📤 4. files uploaded: #{files_uploaded}"
