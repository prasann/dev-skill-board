class CreateStackOverflows < ActiveRecord::Migration
  def change
    create_table :stack_overflows do |t|
      t.references :user
      t.integer :reputation
      t.integer :question_count
      t.integer :answer_count
      t.text :tags
      t.timestamps
    end
  end
end
