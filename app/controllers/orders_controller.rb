class OrdersController < ApplicationController
  def index
  end

  def create
    flat_price = params[:order][:flat_price].to_i
    flat_photo = params[:order][:flat_photo]
    car_price = params[:order][:car_price].to_i
    car_photo = params[:order][:car_photo]
    offer_price = params[:order][:offer_price].to_i

    @order = Order.new()
    @order.user = current_user
    @order.domain = Domain.find(params[:order][:domain])
    @order.drivy_data = { price: car_price, photo: car_photo }
    @order.homeaway_data = { price: flat_price, photo: flat_photo }

    @order.amount = offer_price
    @order.status = "pending"
    @order.save

    redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:car_price, :car_photo, :flat_price, :flat_photo, :offer_price)
  end
end
