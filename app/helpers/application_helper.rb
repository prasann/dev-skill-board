module ApplicationHelper

  def get_site_for(provider,sites)
    sites.select { |site| site.provider == provider }.first.last_sync_time
  end
end
