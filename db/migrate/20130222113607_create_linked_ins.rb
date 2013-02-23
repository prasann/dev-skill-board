class CreateLinkedIns < ActiveRecord::Migration
  def change
    create_table :linked_ins do |t|
      t.references :user
      t.text :skills
      t.timestamps
    end
  end
end
