class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def new
    @offer = Offer.new
  end

  def index

    completed_ids = BookingStatus.where(completed: true).pluck(:booking_id)
    completed_bookings = Booking.where(id: completed_ids).pluck(:offer_id)
    @offers_active = Offer.where.not(id: completed_bookings )

    if params[:query].present?
      @offers = Offer.where("title ILIKE :query or body ILIKE :query", query: "%#{params[:query]}%") # where.not(id: completed_bookings )
    else
      @offers = Offer.all # where.not(id: completed_bookings )
    end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { offer: offer }),
        marker_html: render_to_string(partial: "marker", locals: { offer: offer })
      }
    end
  end

  ##### DUPLICATED INDEX CODE FOR THE LANDING PAGE ###############################333333
  def landing

    completed_ids = BookingStatus.where(completed: true).pluck(:booking_id)
    completed_bookings = Booking.where(id: completed_ids).pluck(:offer_id)
    @offers_active = Offer.where.not(id: completed_bookings )

    if params[:query].present?
      @offers = Offer.where("title ILIKE :query or body ILIKE :query", query: "%#{params[:query]}%") # where.not(id: completed_bookings )
    else
      @offers = Offer.all # where.not(id: completed_bookings )
    end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { offer: offer }),
        marker_html: render_to_string(partial: "marker", locals: { offer: offer })
      }
    end
  end
  ######################################################################################

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
    @offer.typeofoffer = params[:offer][:foodtype].reject{|el| el === ''}.join(',')
    @offer.pickupslots = params[:offer][:pickupslots].reject{|el| el === ''}.join(',')
    @offer.allergen = params[:offer][:allergen].reject{|el| el === ''}.join(',')
    @offer.user = current_user

    if @offer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)


    redirect_to dashboard_index_path
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to(dashboard_index_path, status: :see_other)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :body, :address, :pickupslots, :typeofoffer, :foodtype, :allergens, images: [])
  end
end
