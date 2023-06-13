class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new

  end


  def create

    @review = Review.new(rating: params[:review][:rating], booking_id: params[:booking_id], reviewer_id: current_user.id)
    @booking = Booking.find(params[:booking_id])

    if @review.save

      redirect_to new_booking_review_path(@booking)
    else
      render :new
    end
  end


    private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
