class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @password = params["user"]["password"]
    @confirm_password = params["user"]["password_confirmation"]

    @user = User.new(permit_user)

    if @user.save
      redirect_to @user
    else
      puts @user.errors.messages
      render 'welcome/index'
    end
  end

  private

  def permit_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
