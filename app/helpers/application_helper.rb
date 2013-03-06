module ApplicationHelper

  def get_site_for(provider,sites)
    sites.select { |site| site.provider == provider }.first.updated_at
  end
end
