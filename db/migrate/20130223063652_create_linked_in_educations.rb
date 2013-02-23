class CreateLinkedInEducations < ActiveRecord::Migration
  def change
    create_table :linked_in_educations do |t|
      t.references :linked_in
      t.string :degree
      t.string :schoolName
      t.string :fieldOfStudy
      t.string :startDate
      t.string :endDate
      t.timestamps
    end
  end
end
