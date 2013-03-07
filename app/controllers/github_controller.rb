class GithubController < ApplicationController
  CALL_BACK_URL = 'http://dev-board.herokuapp.com/github/callback'

  def profile
    @gitrepos = GithubRepo.find_all_by_user_id(current_user.id)
  end

  def success
    access_token = Site.access_token_for(Site::PROVIDERS[:github])
    github = Github.new :oauth_token => access_token
    repo_json = github.repos.list
    GithubRepos.update_repos(repo_json)
    redirect_to friendly_wall_path(current_user.profile.user_name)
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
