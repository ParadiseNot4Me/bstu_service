class RenameProgressStudentField < ActiveRecord::Migration
  def change
  	rename_column :student_progresses, :presence, :attendance
  end
end
