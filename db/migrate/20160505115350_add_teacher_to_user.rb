class AddTeacherToUser < ActiveRecord::Migration
  def change
  	  add_column :users, :teacher_id, :integer 
  	  add_reference :users, :teachers, index: true, foreign_key: true
  end
end
