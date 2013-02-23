class CreateLinkedInPositions < ActiveRecord::Migration
  def change
    create_table :linked_in_positions do |t|
      t.references :linked_in
      t.string :company_name
      t.string :company_industry
      t.boolean :is_current
      t.string :startDate
      t.string :endDate
      t.string :title
      t.string :summary
      t.timestamps
    end
  end
end