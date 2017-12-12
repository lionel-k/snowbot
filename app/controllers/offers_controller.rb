class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:checkin].first.blank? || params[:checkout].first.blank? || params[:start_city].blank? || params[:guests_number].blank?
      redirect_to root_path
    else
      @start_city = params["start_city"]
      @checkin = Date.parse(params[:checkin].first)
      @checkout = Date.parse(params[:checkout].first)
      @diff_days = @checkout.mjd - @checkin.mjd
      @guests_number = params[:guests_number]
      offers_service = CreateOffersService.new(
        mountain_chain: params[:mountain_chain],
        start_city: params[:start_city],
        checkin: params[:checkin],
        checkout: params[:checkout],
        guests_number: params[:guests_number],
        user: User.first # Has to be the first user which is the default one
      )

      @offers = offers_service.call
      @order = Order.new
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @order = Order.new
    @checkin = Date.parse(@offer.user.query["checkin"])
    @checkout = Date.parse(@offer.user.query["checkout"])
    @guests_number = @offer.user.query["guests_number"]
    @diff_days = @checkout.mjd - @checkin.mjd
  end
end
