class Site < ActiveRecord::Base

  belongs_to :profile
  PROVIDERS = {
      :github => "Github"
  }

  def self.persist_provider(provider, access_token)
    Site.create!({
                     :profile_id => current_profile,
                     :provider => provider,
                     :access_token => access_token
                 })
  end

  def self.access_token_for(provider)
    get_site_token(provider).access_token
  end

  def self.is_access_token_present?(provider)
    get_site_token(provider).present?
  end

  private
  def self.get_site_token(provider)
    Site.find_by_profile_id_and_provider(current_profile, provider)
  end

  def self.current_profile
    User.current.profile.try(:id)
  end

end
