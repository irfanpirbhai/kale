class My::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def create
    my_ids = params[:item_ids]
    my_ids = my_ids.map{|i| i.to_i}
    @user = current_user
    
    my_ids.each do |my_id|
      @item_list = @user.list.items.push(Item.find(my_id))
    end

    if @item_list
        flash[:success] = "Added!"
        redirect_to '/my/list'
    else
      flash[:error] = "Woops!"
      redirect_to '/items'
    end

  end

  def new 
  end

end
