class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if false # current_user.role.admin?
      @vehicles = Vehicle.all
      render '_admin'
    else
      @vehicles = current_user.vehicles
      render '_user'
    end
  end

  def show
  end

  def new
    @vehicle = current_user.vehicles.build
  end

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)
    @vehicle.user_id = current_user.id
    if @vehicle.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to :back
    else
      render 'edit'
    end
  end

  def destroy
    if @vehicle.destroy
      redirect_to :back
    end
  end

  private
  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :colour, :manufacturer, :model, :year, :user)
  end
end
