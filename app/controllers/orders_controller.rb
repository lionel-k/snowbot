class OrdersController < ApplicationController
  def index
  end

  def create
    flat_price = params[:order][:flat_price].to_i
    flat_photo = params[:order][:flat_photo]
    car_price = params[:order][:car_price].to_i
    car_photo = params[:order][:car_photo]
    @order = Order.new()
    @order.user = current_user
    @order.domain = Domain.find(params[:order][:domain])
    @order.drivy_data = { price: car_price, photo: car_photo }
    @order.homeaway_data = { price: flat_price, photo: flat_photo }
    # total_price = (car_price + flat_price) * 100
    @order.amount = car_price + flat_price
    @order.status = "pending"
    @order.save
    redirect_to new_order_payment_path(@order)

    # if @order.save
    #   render :index
    # else
    #   redirect_to offers_path
    # end
  end

  private

  def order_params
    params.require(:order).permit(:car_price, :car_photo, :flat_price, :flat_photo)
  end
end
