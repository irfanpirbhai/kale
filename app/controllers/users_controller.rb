class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      flash[:success] = "Success! You're all signed up!"
      redirect_to :root
    else
      render :new
    end
  end

end
