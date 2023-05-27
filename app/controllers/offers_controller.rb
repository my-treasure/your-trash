class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def new
    @offer = Offer.new
  end

  def index
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

  def show
    @offer = Offer.find(params[:id])
    @markers = [
      {
        lat: @offer.latitude,
        lng: @offer.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { offer: @offer }),
        marker_html: render_to_string(partial: "marker", locals: { offer: @offer })
      }
    ]
  end

  def create
    @offer = Offer.new(offer_params)
    @user = current_user
    @offer.user = @user

    if @offer.save

      redirect_to root_path

    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :body, :address, images: [])
  end
end
