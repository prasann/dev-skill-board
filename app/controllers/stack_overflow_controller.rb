require 'stack_overflow'
class StackOverflowController < ApplicationController

  def add
  end

  def create
    Site.persist_provider(Site::PROVIDERS[:stackoverflow], params[:so_user_id])
    redirect_to stack_overflow_stats_path
  end

  def populate_stats
    return unless Site.is_access_token_present?(Site::PROVIDERS[:stackoverflow])
    StackOverflow.update_so_instance
    redirect_to friendly_wall_path(current_user.profile.user_name)
  end

end
