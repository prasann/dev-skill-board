class Blog < ActiveRecord::Base
  has_many :blog_items

  def self.create_feed_entry(feed)
    blog = Blog.create!({
                            :user_id => User.current.id,
                            :title => feed.title,
                            :link => feed.url,
                        })
    BlogItem.create_items(blog, feed)
  end
end
