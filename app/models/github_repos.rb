class GithubRepos
  def self.create(repo_json)
    repo_json.each do |repo_hash|
      GithubRepo.create_from_hash(repo_hash)
    end
  end
end
