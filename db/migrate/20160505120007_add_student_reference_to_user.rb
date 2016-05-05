class AddStudentReferenceToUser < ActiveRecord::Migration
  def change
  	 add_reference :users, :students, index: true, foreign_key: true
  end
end
