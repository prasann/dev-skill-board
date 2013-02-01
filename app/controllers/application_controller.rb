class ApplicationController < ActionController::Base
  layout :layout
  before_filter :authenticate_user!
  before_filter :create_profile
  before_filter :set_current_user

  def set_current_user
    User.current=current_user
  end

  def create_profile
    if current_user.present? and current_user.profile.nil?
      redirect_to new_profile_path
    end
  end

  private
  def layout
    return "devise" if devise_controller?
    "application"
  end

end
