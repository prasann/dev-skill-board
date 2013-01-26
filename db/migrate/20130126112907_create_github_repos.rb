class CreateGithubRepos < ActiveRecord::Migration
  def change
    create_table :github_repos do |t|
      t.references :user
      t.integer :repo_id
      t.string :name
      t.integer :forks
      t.string :owner
      t.string :language
      t.integer :watchers
      t.timestamps
    end
  end
end
