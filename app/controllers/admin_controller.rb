class AdminController < ApplicationController

  def main
  end

  def new
    @admin = Admin.new
  end

end
