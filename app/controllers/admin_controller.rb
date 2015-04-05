class AdminController < ApplicationController
  before_action :authenticate_admin!

  def main
  end

  def new
  end

end
