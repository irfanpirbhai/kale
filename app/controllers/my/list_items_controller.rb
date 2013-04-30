class My::ListItemsController < ApplicationController
  
  before_filter :require_login

  def create
    my_ids = params[:item_ids]
    my_ids = my_ids.map{|i| i.to_i}
    @user = current_user
    @list_items = []
    @errors = []

    my_ids.each do |my_id|
      list_item = @user.list.list_items.build(:item => (Item.find(my_id)))
      if list_item.valid?
        @list_items << list_item.save
      else
        @errors << list_item.errors
      end
    end

    if @errors.count == 0
      flash[:success] = "Added all items!"
      redirect_to '/my/list'
    else
      flash[:alert] = "Added only new items on list."
      redirect_to '/my/list'
    end

  end

  def update
    @list_item = ListItem.find(params[:id])
    @list_item.inventory_record_id = (params[:list_item][:inventory_record_id])
    @list_item.save
    if @list_item.save
      flash[:success] = "Item updated."
      redirect_to '/my/list'
    else
      flash[:error] = "Woops! There was a problem."
      redirect_to '/my/list'
    end
  end

  def update_many
    @user = current_user
    @list = @user.list
    @items = Item.all
    # "list_item"=>{"inventory_record_id"=>"27"}, "list_item_id"=>"1"}

    value = params[:list_item][:inventory_record_id]
    update_list_items = @list.list_items.update_all(:inventory_record_id => value)

    if update_list_items
      flash[:success] = "Items updated."
      redirect_to '/my/list'
    else
      flash[:error] = "Woops! There was a problem."
      redirect_to '/my/list'
    end

  end

  def destroy
    @list_item = ListItem.find(params[:id])
      
    if @list_item.delete
        flash[:alert] = "Item removed."
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
