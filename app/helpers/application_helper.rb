module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_user_name(session[:user_name]) if session[:user_name]
  end
end
