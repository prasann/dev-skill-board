class Blog < ActiveRecord::Base
  has_many :blog_items

  def self.create_feed_entry(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    wait_for_the_feed_to_return(feed)
    blog = create_blog_entry(feed)
    BlogItem.add_entries(blog, feed.entries)
  end

  private
  def self.create_blog_entry(feed)
    user = User.current.id
    blog = Blog.find_by_user_id_and_link(user, feed.url)
    return blog if blog.present?
    Blog.create!({
                     :user_id => user,
                     :title => feed.title,
                     :link => feed.url,
                 })
  end

  def self.wait_for_the_feed_to_return(feed)
    i=0
    while feed == nil && i<=10 do
      sleep(i+=1)
    end
    raise_error if feed.nil?
  end

  def self.raise_error
    Site.delete_feed_entry
    raise 'Feed cannot be retrieved at this moment'
  end

end