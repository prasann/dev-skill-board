class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :sites
  validates_presence_of :user_name, :email
end
