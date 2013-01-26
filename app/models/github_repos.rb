class GithubRepos
  def self.create(repo_json)
    repos = ActiveSupport::JSON.decode(repo_json)
    repos.each do |repo_hash|
      GithubRepo.create_from_hash(repo_hash)
    end
  end
end
