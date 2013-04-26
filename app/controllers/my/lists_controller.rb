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
    # @list = List.items.new(params[:item])
    # if @list.save
    #   flash[:success] = "Added!"
    #   redirect_to :index
    # else
    #   flash[:error] = "Woops!"
    #   redirect_to :index
    end

  private

  def not_authenticated
    flash[:alert] = "Please log in."
    redirect_to login_path
  end

end
