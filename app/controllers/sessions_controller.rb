class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email],params[:password])
    if user
      flash[:success] = "Welcome back, #{user.first_name}!"
      redirect_back_or_to root_path
    else
      flash.now[:error] = "Woops! Invalid email or password"
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged out. See you later!"
    redirect_to root_path
  end


end
