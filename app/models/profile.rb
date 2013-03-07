class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :sites
  has_attached_file :avatar,
                    :default_url => ActionController::Base.helpers.asset_path("missing_icon.jpg"),
                    :styles => {:medium => "300x300>"}
  has_attached_file :cover_image,
                    :default_url => ActionController::Base.helpers.asset_path("missing_cover.jpg"),
                    :styles => {:medium => "850x350>"}

  validates_presence_of :user_name, :email
  validates_uniqueness_of :user_name
end
