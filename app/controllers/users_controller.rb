class UsersController < ApplicationController
  protect_from_forgery

  def show
    @user = User.find_by_user_name(params[:user_name])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to vanity_url_path(@user.user_name)
  end
end
