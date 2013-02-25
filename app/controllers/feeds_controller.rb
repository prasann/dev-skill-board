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
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    Blog.create_feed_entry(feed)
    redirect_to friendly_wall_path(current_user.profile.user_name)
  end

end
