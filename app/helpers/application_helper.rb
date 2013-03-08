module ApplicationHelper

  def get_site_for(provider,sites)
    sites.select { |site| site.provider == provider }.first.updated_at
  end

  def is_not_guest?
    User.current.profile.user_name != 'guest'
  end
end
