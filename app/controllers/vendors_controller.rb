class VendorsController < ApplicationController
  
  def index
    @current_location = request.location.try(:city)
    @user_ip = request.ip
    
    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance] || 5, order: :distance)
    else
      @vendors = Vendor.all
    end
  end

end