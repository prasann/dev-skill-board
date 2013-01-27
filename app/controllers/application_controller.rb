class ApplicationController < ActionController::Base
  layout :layout
  before_filter :authenticate_user!
  before_filter :set_current_user

  def set_current_user
    User.current=current_user
  end

  private
  def layout
    return "devise" if devise_controller?
    "application"
  end
end
