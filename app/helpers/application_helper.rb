module ApplicationHelper

  def address_text(entry)
    entry.address&.split(",")[-4..-2]&.join
  end

  def distance_km(start, finish)
    Geocoder::Calculations.distance_between([start.latitude, start.longitude], [finish.latitude, finish.longitude]).round(2)
  end
end
