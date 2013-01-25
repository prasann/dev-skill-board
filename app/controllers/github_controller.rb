class GithubController < ApplicationController
  CALL_BACK_URL = 'http://localhost:3000/github/callback'

  def success
    p Settings.github_id
    access_token = Site.access_token_for(Site::GITHUB)
    github = Github.new :oauth_token => access_token
    render :json => github.repos.list
  end

  def authorize
    redirect_to github_success_path and return if Site.is_access_token_present?(Site::GITHUB)
    redirect_to github_instance.authorize_url :redirect_uri => CALL_BACK_URL, :scope => 'repo'
  end

  def callback
    token = github_instance.get_token params[:code]
    Site.persist_provider(Site::GITHUB, token.token)
    redirect_to github_success_path
  end

  private
  def github_instance
    Github.new :client_id => Settings.github_id, :client_secret => Settings.github_secret
  end
end
