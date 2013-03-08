class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :sites
  has_attached_file :avatar,
                    :default_url => "/assets/missing_:style.jpg",
                    :storage => :s3,
                    :s3_credentials => Rails.root.join('config','s3.yml'),
                    :path => "/avatar/:style/:user_name/:filename",
                    :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :cover_image,
                    :default_url => ActionController::Base.helpers.asset_path("missing_cover.jpg"),
                    :storage => :s3,
                    :s3_credentials => Rails.root.join('config','s3.yml'),
                    :path => "/cover/:style/:user_name/:filename",
                    :styles => {:medium => "850x350>"}

  validates_presence_of :user_name, :email
  validates_uniqueness_of :user_name

  Paperclip.interpolates :user_name do |attachment, style|
    attachment.instance.user_name
  end
end
