class AddStudentStudentProgress < ActiveRecord::Migration
  def change
  	add_reference :student_progresses, :student, index: true, foreign_key: true
  end
end
