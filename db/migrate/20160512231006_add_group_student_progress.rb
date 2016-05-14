class AddGroupStudentProgress < ActiveRecord::Migration
  def change
  	add_reference :student_progresses, :group, index: true, foreign_key: true
  end
end
