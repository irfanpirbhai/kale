class My::ListsController < ApplicationController

  # autocomplete :item, :name, :full => true

  before_filter :require_login

  def show
    @user = current_user
    @list = @user.list
    @items = Item.all
    
    # @current_location = request.location
    # @client_ip = request.ip
  end

  def new
  end

  def update
    @user = current_user
    @list = @user.list
    @items = Item.all

    # update_to_nil = @list.list_items.update_all(:inventory_record_id => nil)

    # if update_to_nil
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
