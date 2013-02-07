class ApplicationController < ActionController::Base
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
end
