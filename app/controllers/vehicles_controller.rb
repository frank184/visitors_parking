class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destory]
  before_action :authenticate_user!

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @vehicle.destroy
    @vehicle.save
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :colour, :manufacturer, :model, :year)
  end

  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

end
