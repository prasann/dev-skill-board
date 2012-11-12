class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_name] = user.user_name
    redirect_to vanity_url_path(user.user_name), notice: "Signed in!"
  end

  def destroy
    session[:user_name] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
