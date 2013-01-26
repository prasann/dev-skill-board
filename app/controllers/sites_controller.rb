class SitesController < ApplicationController
  def index
    sites = Site.find_all_by_user_id(current_user.id)
    @providers = sites.collect(&:provider) if sites.present?
  end
end
