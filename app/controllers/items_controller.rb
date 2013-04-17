class ItemsController < ApplicationController

  autocomplete :item, :name, :full => true

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
      redirect_to :root
    else
      flash[:error] = "Woops!"
      redirect_to :root
    end
  end

end
