class HomeController < ApplicationController

  def index
  end

  def show
    @marker = Marker.all
  end

  
end
