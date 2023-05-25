class ReviewsController < ApplicationController
  def create
    offer = Offer.find(params[:offer_id])
    @message = offer.messages.build(message_params)
    @message.user = current_user

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
