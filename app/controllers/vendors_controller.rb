class VendorsController < ApplicationController
  
  def index
    @user_ip = request.ip
    @inputted_location = Geocoder.coordinates(params[:location])
    @current_location = request.location
    
    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance], order: :distance)
    else
      @vendors = Vendor.all
    end

    respond_to do |format|
      format.html
      # format.json { render :json => @vendors }
    end
  end
end