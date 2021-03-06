class My::ItemsController < ApplicationController
  
  before_filter :require_login

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
      flash[:error] = "Woops! You already have that in your list."
      redirect_to '/items'
    end

  end

  def update
    @item = Item.find(params[:id])
    @item_list = current_user.list.items.delete(@item)
      
    if @item_list
        flash[:success] = "Item removed."
        redirect_to '/my/list'
    else
        flash[:error] = "Woops! There was a problem."
        redirect_to '/my/list'
    end

  end

  def destroy
    @item = Item.find(params[:id])
    @item_list = current_user.list.items.delete(@item)
      
    if @item_list
        flash[:success] = "Item removed."
        redirect_to '/my/list'
    else
        flash[:error] = "Woops! There was a problem."
        redirect_to '/my/list'
    end
  end

  private

  def not_authenticated
    flash[:alert] = "Please log in."
    redirect_to login_path
  end

end
