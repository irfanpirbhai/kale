class VendorsController < ApplicationController
  
  def index
    @current_location = request.location.try(:city)
    @user_ip = request.ip
    @inputted_location = Geocoder.coordinates(params[:location])

    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance], order: :distance)
    else
      @vendors = Vendor.all
    end

    @markers = @vendors.to_gmaps4rails

  end

end
