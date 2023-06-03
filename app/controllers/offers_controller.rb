class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def new
    @offer = Offer.new
  end

  def index
    @offers = Offer.all

    # filter out the offers that are booked
    completed_ids = BookingStatus.where(completed: true).pluck(:booking_id)
    completed_bookings = Booking.where(id: completed_ids).pluck(:offer_id)
    @offers_active = Offer.where.not(id: completed_bookings )

    #@offers_unbooked = Offer.where.missing(:bookings)
    #Offer.includes(bookings: :booking_status).where.not(booking_status: { completed: true } ) # returning only offers with bookings
    #@offers_active = Offer.includes(:bookings).where.not(bookings: { booking_statuses: { completed: true } }) - not working

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

    @booking = Booking.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.pickupslots = params[:offer][:pickupslots].reject{|el| el === ''}.join(',')
    @offer.allergen = params[:offer][:allergen].reject{|el| el === ''}.join(',')
    @offer.user = current_user

    if @offer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :body, :address, :pickupslots, :typeofoffer, :foodtype, :allergens, images: [])
  end
end
