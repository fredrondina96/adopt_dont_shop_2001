class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    # @shelter_id = params[:id]
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter =  Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def create
    shelter = Shelter.create!(shelter_params)
    redirect_to '/shelters'
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :zip, :state)
  end
end
