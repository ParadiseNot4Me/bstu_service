class AddStudentOnUser < ActiveRecord::Migration
  def change
  	add_column :users, :student_id, :integer
  end
end
