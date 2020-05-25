class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save

    redirect_to car_path(@car)
  end

private

def car_params
  params.require(:car).permit(:brand, :model, :year, :horse_power, :price, :description, :user_id)


end
end

