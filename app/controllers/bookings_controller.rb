class BookingsController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer

    if @booking.save

      redirect_to booking_path(@booking)

    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @offer =  Offer.find(@booking.offer_id)
    # @markers = [
    #   {
    #     lat: @post.latitude,
    #     lng: @post.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { post: @post }),
    #     marker_html: render_to_string(partial: "marker", locals: { post: @post })
    #   }]
  end

  private

  def booking_params
    params.require(:booking).permit(:pick_up_time, :offer_id, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
