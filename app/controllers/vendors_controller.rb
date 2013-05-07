class VendorsController < ApplicationController
  
  def index
    @user_ip = request.ip
    @current_location = request.location
    
    @inputted_location = Geocoder.coordinates(params[:location])

    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance], order: :distance)
    else
      @vendors = Vendor.all
    end

  end

end