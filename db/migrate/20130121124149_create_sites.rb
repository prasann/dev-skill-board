class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :profile
      t.string :provider
      t.string :access_token
      t.timestamps
    end
  end
end
