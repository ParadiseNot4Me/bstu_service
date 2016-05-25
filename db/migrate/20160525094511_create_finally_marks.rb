class CreateFinallyMarks < ActiveRecord::Migration
  def change
    create_table :finally_marks do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.integer :mark

      t.timestamps null: false
    end
  end
end
