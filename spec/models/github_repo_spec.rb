require 'spec_helper'

describe GithubRepo do
  describe "create" do
    before do
      fake_sign_in
    end
    it "should create github repo from hash" do
      repo_json = File.read(File.join(Rails.root, "spec/data/single_repo.json"))
      repo_hash = ActiveSupport::JSON.decode(repo_json)
      expect {
        GithubRepo.create_from_hash(repo_hash)
      }.to change(GithubRepo, :count).by(1)
    end
  end

end
