require 'spec_helper'

describe GithubRepos do
  describe 'create github repos' do
    before do
      fake_sign_in
    end
    it "should create repos from json" do
      json_string = File.read(File.join(Rails.root, "spec/data/repos.json"))
      json = ActiveSupport::JSON.decode(json_string)
      expect {
        GithubRepos.create(json)
      }.to change(GithubRepo, :count).by(29)
    end
  end

end
