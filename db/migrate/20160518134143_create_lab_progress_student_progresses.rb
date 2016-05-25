class CreateLabProgressStudentProgresses < ActiveRecord::Migration
  def change
    create_table :lab_progress_student_progresses do |t|
      t.references :lab_progresses, index: true, foreign_key: true
      t.references :student_progresses, index: true, foreign_key: true
 
      t.timestamps null: false
    end
  end
end
