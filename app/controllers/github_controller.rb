class GithubController < ApplicationController
  CALL_BACK_URL = 'http://localhost:3000/github/callback'

  def success
    access_token = Site.access_token_for(Site::PROVIDERS[:github])
    github = Github.new :oauth_token => access_token
    repo_json = github.repos.list
    GithubRepos.create(repo_json)
    render :json => repo_json
  end

  def authorize
    redirect_to github_success_path and return if Site.is_access_token_present?(Site::PROVIDERS[:github])
    redirect_to github_instance.authorize_url :redirect_uri => CALL_BACK_URL, :scope => 'repo'
  end

  def callback
    token = github_instance.get_token params[:code]
    Site.persist_provider(Site::PROVIDERS[:github], token.token)
    redirect_to github_success_path
  end

  private
  def github_instance
    Github.new :client_id => Settings.github_id, :client_secret => Settings.github_secret
  end
end
