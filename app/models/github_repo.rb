class GithubRepo < ActiveRecord::Base
  def self.create_from_hash(repo_hash)
    GithubRepo.create!({
                           :user_id => User.current.id,
                           :name => repo_hash["name"],
                           :forks => repo_hash["forks"],
                           :owner => repo_hash["owner"]["login"],
                           :language => repo_hash["language"],
                           :watchers => repo_hash["watchers"]
                       })
  end
end
