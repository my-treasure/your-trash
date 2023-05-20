Unsplash.configure do |config|
  config.application_access_key = ENV.fetch("UNSPLASH_ACCESS_KEY")
  config.application_secret = ENV.fetch("UNSPLASH_SECRET_KEY")
  config.application_redirect_uri = "https://rubbish-map.herokuapp.com"
  config.utm_source = "rubbish_map"
end
