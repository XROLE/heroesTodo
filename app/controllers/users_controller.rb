class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(permit_user)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/todos'
    else
      puts @user.errors.messages
      render 'welcome/index'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id]);

    if @user.update(permit_user)
      redirect_to '/todos'
    else
      render 'edit'
    end
  end

  private

  def permit_user
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name, :image)
  end
end
