class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :user_name

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    User.create!({
                     :provider => auth["provider"],
                     :uid => auth["uid"],
                     :user_name => auth["uid"],
                     :name => auth["info"]["name"]
                 })
  end
end
