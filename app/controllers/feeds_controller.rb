require 'feedzirra'
class FeedsController < ApplicationController
  def add
  end

  def create
    Site.persist_provider(Site::PROVIDERS[:rssfeed], params[:feed_url])
    redirect_to feeds_stats_path
  end

  def stats
    feed_url = Site.access_token_for(Site::PROVIDERS[:rssfeed])
    begin
      Blog.create_feed_entry(feed_url)
    rescue Exception => e
      redirect_to friendly_profile_path(current_user.profile.user_name), :notice => e.message and return
    end
    redirect_to friendly_wall_path(current_user.profile.user_name)
  end
end
