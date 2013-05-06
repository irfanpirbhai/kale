class My::ListsController < ApplicationController

  # autocomplete :item, :name, :full => true

  before_filter :require_login

  def show
    @user = current_user
    @list = @user.list
    @items = Item.all
    
    @current_location = request.location
    @user_ip = request.ip
    
    @inputted_location = Geocoder.coordinates(params[:location])

    if params[:location].present?
      @vendors = Vendor.near(params[:location], params[:distance], order: :distance)
    else
      @vendors = Vendor.all
    end

    @markers = @vendors.to_gmaps4rails
    
  end

  def new
  end

  def update_many
    @user = current_user
    @list = @user.list
    @items = Item.all
    update_value = params[:update_value]

    if (update_value == "forget")
      update_list_items = @list.list_items.update_all(:inventory_record_id => nil)
    elsif (update_value == "cheapest")
      @list.list_items.each do |list_item|
        list_item.inventory_record_id = list_item.item.inventory_records.order("price_cents asc").first.id
        list_item.save
      end
    end

    redirect_to '/my/list'

    # if update_list_items
    #   flash[:success] = "Items updated."
    #   redirect_to '/my/list'
    # else
    #   flash[:error] = "Woops! There was a problem."
    #   redirect_to '/my/list'
    # end

  end

  private

  def not_authenticated
    flash[:alert] = "Please log in."
    redirect_to login_path
  end

end
