class VendorsController < ApplicationController
  
  def index
    @current_location = request.location.try(:city)
    @user_ip = request.ip
    
    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance] || 10, order: :distance)
    else
      @vendors = Vendor.all
    end

    @vendors = @vendors.to_gmaps4rails

  end

end
