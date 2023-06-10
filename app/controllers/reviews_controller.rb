class ReviewsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    raise
    rating = Review.new(rating: params[:review][:rating], booking_id: params[:booking_id])

    if @message.save
      redirect_to offer_path(post)
    else
      render :new
    end
  end

    private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
