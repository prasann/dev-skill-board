class BlogItem < ActiveRecord::Base
  belongs_to :blog

  def self.create_items(blog, feed)
    feed.entries.each do |entry|
      BlogItem.create!({
                           :blog_id => blog.id,
                           :title => entry.title,
                           :description => entry.summary,
                           :categories => entry.categories.join(',')
                       })
    end
  end
end
