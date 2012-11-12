class UsersController < ApplicationController

  def show
    @user = User.find_by_user_name(params[:user_name])
  end

end
