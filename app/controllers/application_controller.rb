class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_current_user

  def set_current_user
    User.current=current_user
  end

end
