require 'net/http'
require 'net/https'
require 'open-uri'

module ApplicationHelper

  # address helpers
  def short_address_text(entry)
    if entry.address.nil?
      return "No address provided"
    else
      entry.address&.split(",")&.join
    end
  end

  def long_address_text(entry)
    if entry.address.nil?
      return "No address provided"
    else
      entry.address&.split(",")&.join(", ")
    end
  end

  # check for unread messages in all user chatrooms
  def unread_messages()
    if current_user.nil?
      return 0
    else
      chatroom_ids_as_booker = Chatroom.where(booker_id: current_user.id).pluck(:id)
      chatroom_ids_as_offerer = Chatroom.where(offerer_id: current_user.id).pluck(:id)
      chatroom_ids = chatroom_ids_as_booker + chatroom_ids_as_offerer
      unread_messages = Message.where(chatroom_id: chatroom_ids).where(read: false).where.not(user: current_user)
      unread_messages.count
    end
  end

  # image helpers
  def user_avatar(user)
    if user.nil?
      image_tag 'default_avatar.png', class: "avatar-show"
    elsif user.profile_picture.attached?
      cl_image_tag user.profile_picture.key,
        :gravity => "center",
        :height => 60,
        :width => 60,
        :crop => "fill",
        :class =>"avatar-show"
    else
      image_tag 'default_avatar.png', class: "avatar-show"
    end
    # https://res.cloudinary.com/dxdyu4tqu/image/upload/v1683908905/profile_pictures/photo-1583795128727-6ec3642408f8.jpg
  end

	def offer_image(offer)
    if offer.nil?
      image_tag('default_pic.png')
    elsif offer.images.attached?
      url = cloudinary_url(offer.images[0].key)
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      if response.code.to_i == 404
        image_tag('default_pic.png')
      else
        cl_image_tag(offer.images[0].key)
      end
    else
      image_tag('default_pic.png')
    end
  end

  def offer_image_background(offer)
    if offer.nil?
      'default_pic.png'
    elsif offer.images.attached?
      url = cloudinary_url(offer.images[0].key)
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      if response.code.to_i == 404
        image_tag('default_pic.png')
      else
        cl_image_path(offer.images[0].key)
      end
    else
      image_tag('default_pic.png')
    end
  end

  # geocoder helpers
  def make_abstract_request
    api_key = ENV.fetch('ABSTRACT_API_KEY')
    uri = URI("https://ipgeolocation.abstractapi.com/v1/?api_key=#{api_key}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    # return response.body
    return 1
    rescue StandardError => error
      puts "Error (#{ error.message })"
  end

  def get_ip_coordinates
    response = make_abstract_request
    JSON.parse(response)
  end

  def distance_km(start, finish)
    if start.nil? | current_user.nil?
      "-"
    else
      Geocoder::Calculations.distance_between([start.latitude, start.longitude], [finish.latitude, finish.longitude]).round(2)
    end
  end

  def user_location_to_json()
    if current_user.nil?
      return ""
    else
      user_location = current_user.dup
      user_location.to_json
    end
  end

end
