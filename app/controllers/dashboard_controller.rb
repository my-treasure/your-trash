class DashboardController < ApplicationController
  def index
    @offers = current_user.offers
    @bookings = current_user.bookings
  end

  def update_offer
    @offer = Offer.find(params[:id])
    redirect_to dashboard_path
  end

  def delete_offer
    @offer = Offer.find(params[:id])
    offer.destroy
    redirect_to dashboard_path
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.booking_status.update(accepted: true)
    redirect_to dashboard_path
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.booking_status.destroy
    redirect_to dashboard_path
  end

  def confirm_booking
    @booking = Booking.find(params[:id])
    @booking.booking_status.update(completed: true)
    redirect_to dashboard_path
  end
end
