class Profile < ActiveRecord::Base
  validates_presence_of :user_name,:email
end
