class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :user_name
      t.string :email
      t.string :contact_no
      t.timestamps
    end
  end
end
