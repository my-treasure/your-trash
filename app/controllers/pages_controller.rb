class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def map
    @offers = Offer.all
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { offer: offer }),
        marker_html: render_to_string(partial: "marker", locals: { offer: offer })
      }
    end
  end
end
