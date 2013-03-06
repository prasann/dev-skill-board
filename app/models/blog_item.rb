class BlogItem < ActiveRecord::Base
  belongs_to :blog

  def self.add_entries(blog, entries)
    entries.each do |entry|
      unless BlogItem.find_by_guid_and_blog_id(entry.id, blog.id).present?
        create!(
            :blog_id => blog.id,
            :title => entry.title,
            :description => entry.summary,
            :categories => entry.categories.join(','),
            :guid => entry.id
        )
      end
    end
  end
end
