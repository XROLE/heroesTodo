class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
      !current_user.nil?
  end
  def authorized
     redirect_to root_url unless logged_in?
  end
  def show_user_page
    if logged_in?
        redirect_to "/todos"
    end
  end
  end
