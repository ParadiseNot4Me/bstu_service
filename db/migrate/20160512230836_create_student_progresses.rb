class CreateStudentProgresses < ActiveRecord::Migration
  def change
    create_table :student_progresses do |t|
      t.date :date
      t.references :schedule_field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
