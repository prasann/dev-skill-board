require 'spec_helper'

describe GithubRepos do
  describe 'create github repos' do
    before do
      fake_sign_in
    end
    it "should create repos from json" do
      json = File.read(File.join(Rails.root, "spec/data/repos.json"))
      expect {
        GithubRepos.create(json)
      }.to change(GithubRepo, :count).by(29)
    end
  end

end