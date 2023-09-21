class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_picture, :address, :longitude, :latitude, :role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_picture, :address, :longitude, :latitude, :role ])
  end

  # choose different layout for devise
  def layout_by_resource
    if devise_controller?
      "deviselayout"
    else
      "application"
    end
  end

  puts "REDIS_URL: #{ENV.fetch('REDIS_URL')}"
  puts "SCALINGO_REDIS_URL: #{ENV.fetch('SCALINGO_REDIS_URL')}"
end
