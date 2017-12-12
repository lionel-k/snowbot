class OrdersController < ApplicationController
  before_action :set_offer, only: :create

  skip_before_action :authenticate_user!, only: :create
  before_action :custom_authenticate_user!, only: :create

  def index
  end

  def create
    checkin = Date.parse(@offer.user.query["checkin"])
    checkout = Date.parse(@offer.user.query["checkout"])
    guests_number = @offer.user.query["guests_number"]
    diff_days = checkout.mjd - checkin.mjd
    car_price = @offer.car_price.to_i
    car_photo = @offer.car_photo
    flat_price = @offer.flat_price_by_night.to_i
    flat_photo = @offer.flat_photo
    offer_price = @offer.total_price(diff_days).to_i

    @order = Order.new(
      user: current_user,
      domain: @offer.domain,
      drivy_data: { price: car_price, photo: car_photo },
      homeaway_data: { price: flat_price, photo: flat_photo },
      amount: offer_price,
      status: "pending",
      )

    @order.save

    redirect_to new_order_payment_path(@order)
  end

  private

  def custom_authenticate_user!
    return if user_signed_in?

    session[:current_offer_id] = @offer.id
    store_location_for(:user, offer_path(@offer))
    authenticate_user!
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def order_params
    params.require(:order).permit(:car_price, :car_photo, :flat_price, :flat_photo, :offer_price)
  end
end
