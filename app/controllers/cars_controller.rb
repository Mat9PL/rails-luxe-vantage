class CarsController < ApplicationController
before_action :set_car, only: [:show, :edit, :destroy, :update]
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

  redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year, :horse_power, :price, :description, :user_id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

