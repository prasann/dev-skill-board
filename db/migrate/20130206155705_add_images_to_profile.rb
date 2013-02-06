class AddImagesToProfile < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :avatar
    add_attachment :profiles, :cover_image
  end

  def self.down
    remove_attachment :profiles, :cover_image
    remove_attachment :profiles, :avatar
  end
end
