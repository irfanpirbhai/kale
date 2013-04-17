class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.all
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:success] = "Added!"
      redirect_to new_item_path
    else
      flash[:error] = "Woops!"
      render :new
    end
  end

end
