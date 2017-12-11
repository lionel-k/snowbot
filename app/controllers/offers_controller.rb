class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:checkin].first.blank? || params[:checkout].first.blank? || params[:start_city].blank?
      redirect_to root_path
    else
      @checkin = Date.parse(params[:checkin].first)
      @checkout = Date.parse(params[:checkout].first)
      @diff_days = @checkout - @checkin
      @guests_number = params[:guests_number]
      offers_service = CreateOffersService.new(
        mountain_chain: params[:mountain_chain],
        start_city: params[:start_city],
        checkin: params[:checkin],
        checkout: params[:checkout],
        guests_number: params[:guests_number]
      )

      @offers = offers_service.call
      @order = Order.new
    end
  end
end
