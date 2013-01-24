class GithubController < ApplicationController
  def success
    access_token = Site.access_token_for(Site::GITHUB)
    github = Github.new :oauth_token => access_token
    render :json => github.repos.list
  end

  def authorize
    redirect_to github_success_path and return if Site.is_access_token_present?(Site::GITHUB)
    @github = Github.new :client_id => '6865696a3b44618cb40d', :client_secret => '3014399db1e723407f057c67e3df94b91830f52f'
    address = @github.authorize_url :redirect_uri => 'http://localhost:3000/github/callback', :scope => 'repo'
    redirect_to address
  end

  def callback
    @github = Github.new :client_id => '6865696a3b44618cb40d', :client_secret => '3014399db1e723407f057c67e3df94b91830f52f'
    authorization_code = params[:code]
    token = @github.get_token authorization_code
    Site.persist_provider(Site::GITHUB, token.token)
    redirect_to github_success_path
  end
end
