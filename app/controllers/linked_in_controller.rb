class LinkedInController < ApplicationController
  API_KEY = 'zxellbhnw933'
  SECRET_KEY = 'qqCVgR4ny4Sn2tsS'
  REDIRECT_URI = "http://localhost:3000/linkedin/callback"
  STATE = SecureRandom.hex(15)

  def client
    OAuth2::Client.new(
        API_KEY,
        SECRET_KEY,
        :authorize_url => "/uas/oauth2/authorization?response_type=code",
        :token_url => "/uas/oauth2/accessToken",
        :site => "https://www.linkedin.com"
    )
  end

  def index
    redirect_to client.auth_code.authorize_url(:scope => 'r_fullprofile r_emailaddress r_network',
                                               :state => STATE, :redirect_uri => REDIRECT_URI)
  end

  def callback
    code = params[:code]
    token = client.auth_code.get_token(code, :redirect_uri => REDIRECT_URI)
    Site.persist_provider(Site::PROVIDERS[:linkedin], token.token)
    redirect_to linkedin_success_path
  end

  def success
    token = Site.access_token_for(Site::PROVIDERS[:linkedin])
    linked_in_token = access_token(token)
    response_json = linked_in_token.get('/v1/people/~:(positions,skills,educations)?format=json').body
    LinkedIn.create_linked_in(response_json)
    redirect_to friendly_wall_path(current_user.profile.user_name)
  end

  def access_token(token)
    access_token = OAuth2::AccessToken.new(client, token, {
        :mode => :query,
        :param_name => "oauth2_access_token",
    })
  end

end
