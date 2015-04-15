class HomeController < ApplicationController

  def index
  end

  def show
    @markers = Marker.all
    respond_to do |format|
      format.html do
      end

      format.json do
        data = {}
        data[:markers] = @markers
        render :json => data
      end
    end
  end

  
end
