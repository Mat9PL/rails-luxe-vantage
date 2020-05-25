class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save

    redirect_to car_path(@car)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to car_path(@car)
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year, :horse_power, :price, :description, :user_id)
  end
end

