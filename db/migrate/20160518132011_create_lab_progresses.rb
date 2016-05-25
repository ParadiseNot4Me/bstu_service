class CreateLabProgresses < ActiveRecord::Migration
  def change
    create_table :lab_progresses do |t|
      t.references :lab_work, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.integer :mark
      t.integer :intime

      t.timestamps null: false
    end
  end
end
