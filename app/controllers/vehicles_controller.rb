class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destory]
  before_action :authenticate_user!

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
  end

  def edit
  end

  def update
    @vehicle.update
  end

  def destroy
    @vehicle.destroy
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :colour, :manufacturer, :model, :year)
  end

  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

end
