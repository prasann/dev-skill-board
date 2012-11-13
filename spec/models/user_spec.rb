require 'spec_helper'

describe User do

  describe "from_omniauth" do
    it "should get user from DB with given auth provider and UID" do
      user1 = FactoryGirl.create(:user,{:provider => "Google", :uid => "asdadsadad"})
      user2 = FactoryGirl.create(:user,{:provider => "Twitter", :uid => "popopooppp"})
      user3 = FactoryGirl.create(:user,{:provider => "Google", :uid => "popopopopp"})
      auth = {"provider" => "Google","uid" => "asdadsadad"}
      User.from_omniauth(auth).should == user1
    end

    it "should create a new user if no user found in DB" do
      user1 = FactoryGirl.create(:user,{:provider => "Google", :uid => "popopooppp"})
      user2 = FactoryGirl.create(:user,{:provider => "Twitter", :uid => "popopooppp"})
      auth = {"provider" => "Google","uid" => "asdadsadad", "info" => {"name" => "test"}}
      actual_user = lambda{User.from_omniauth(auth)}.should change(User, :count).by(1)
      actual_user.should_not be_nil
    end
  end
end
