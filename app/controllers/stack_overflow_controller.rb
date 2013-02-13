class StackOverflowController < ApplicationController

  def add
  end

  def create
    Site.persist_provider(Site::PROVIDERS[:stackoverflow], params[:so_user_id])
    redirect_to friendly_profile_path(current_user.profile.user_name)
  end

end
