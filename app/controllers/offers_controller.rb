class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def new
    @offer = Offer.new
  end

  def index
    @offers = Offer.all
    # @markers = @posts.geocoded.map do |post|
    #   {
    #     lat: post.latitude,
    #     lng: post.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { post: post }),
    #     marker_html: render_to_string(partial: "marker", locals: { post: post })
    #   }
    end
  end

  def show
    @offer = Offer.find(params[:id])
    # @markers = [
    #   {
    #     lat: @post.latitude,
    #     lng: @post.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { post: @post }),
    #     marker_html: render_to_string(partial: "marker", locals: { post: @post })
    #   }]
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
    params.require(:offer).permit(:title, :body, :address, :post_image)
  end
