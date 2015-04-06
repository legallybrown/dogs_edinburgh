class MarkersController < ApplicationController

  def index
    @markers = Marker.all
  end

  def show
    @marker = Marker.find(params[:id])
  end

  def new
    @marker = Marker.new(params[:marker])
  end

  def create
    @marker = Marker.create(marker_params)
    redirect_to :back
  end


  def edit
    @marker = Marker.find(params[:id])
  end  

  def update
    @marker = Marker.find(params[:id])
    @marker.update_attributes(marker_params)
    flash[:notice] = "Succesfully updated details for #{@marker.name}"
    redirect_to markers_path
  end

  private

  def marker_params
    params.require(:marker).permit(:name, :business_type, :lat, :lng, :url, :opening_time, :closing_time, :rating, :postcode, :street_name, :building_number)
  end

end