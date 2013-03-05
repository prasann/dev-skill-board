class CreateBlogItems < ActiveRecord::Migration
  def change
    create_table :blog_items do |t|
      t.string :guid
      t.references :blog
      t.string :title
      t.string :categories
      t.text :description
      t.timestamps
    end
  end
end
