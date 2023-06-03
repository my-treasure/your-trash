class DashboardController < ApplicationController
  def index
    @offers = current_user.offers
    @bookings = current_user.bookings
  end

  def update_offer
    @offer = Offer.find(params[:id])
    # Update offer logic here
    redirect_to dashboard_path
  end

  def delete_offer
    @offer = Offer.find(params[:id])
    # Delete offer logic here
    redirect_to dashboard_path
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    # Accept booking logic here
    redirect_to dashboard_path
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    # Reject booking logic here
    redirect_to dashboard_path
  end

  def confirm_booking
    @booking = Booking.find(params[:id])
    # Confirm booking logic here
    redirect_to dashboard_path
  end
end
