class WelcomeController < ApplicationController
  before_action :show_user_page

  def index
    @user = User.new
  end
end
