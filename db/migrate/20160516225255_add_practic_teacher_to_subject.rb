class AddPracticTeacherToSubject < ActiveRecord::Migration
  def change
  	add_column :subjects, :practic_teacher_id, :integer
    add_index :subjects, :practic_teacher_id
  end
end
