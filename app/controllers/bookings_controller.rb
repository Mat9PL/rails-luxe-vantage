class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car_id = params[:car_id]
    @car = @booking.car
    if @booking.save
      authorize @booking
      redirect_to car_booking_path(@car, @booking)
    else
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @car = @booking.car
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :user_id, :from, :to, :total_price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
