class Site < ActiveRecord::Base
  PROVIDERS = {
      :github => "Github"
  }

  def self.persist_provider(provider, access_token)
    Site.create!({
                     :user_id => User.current.id,
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
    Site.find_by_user_id_and_provider(User.current.id, provider)
  end

end
