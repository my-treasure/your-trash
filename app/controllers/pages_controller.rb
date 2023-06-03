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

  def profiles
    @user = User.find(params[:id])

  end

  def createprofile
    @logged_in_user = current_user
    @profile_owner = User.find(params[:id])

    @follow = Follow.new
    @follow.user_id = @logged_in_user.id
    @follow.followed_id = @profile_owner.id

    @follow.save

    redirect_to profile_path(@profile_owner)
  end

end
