class AddParamsStudentProgress < ActiveRecord::Migration
  def change
  	add_column :student_progresses, :presence, :integer
  	add_column :student_progresses, :mark, :integer
  	add_column :student_progresses, :intime, :integer
  end
end
