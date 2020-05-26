class CarsController < ApplicationController
before_action :set_car, only: [:show, :edit, :destroy, :update]
  def index
    @cars = policy_scope(Car)
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    authorize @car
    @car.save

    if @car.save
      redirect_to car_path(@car)
    else
      render "form"
    end
  end

  def edit
    authorize @car
  end

  def update
    authorize @car
    @car.update(car_params)

    redirect_to car_path(@car)
  end

  def destroy
    authorize @car
    @car.destroy

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year, :horse_power, :price, :description, :user_id, photos: [])
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

