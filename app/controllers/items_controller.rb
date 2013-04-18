class ItemsController < ApplicationController

  def index
    @items = Item.all
    @user = current_user
  
  end

  def create
  end
end
