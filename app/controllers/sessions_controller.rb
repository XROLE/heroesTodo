class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params['user']['email'])
    if @user && @user.authenticate(params['user']['password'])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] ="Email or Password is incorrect"
      render "welcome/index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_ur, "Logged out!"
  end
end
