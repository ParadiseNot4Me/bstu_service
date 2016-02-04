class RefactorStewards < ActiveRecord::Migration
  def change
  	remove_column :stewards, :user_id
  	add_column :stewards, :student_id, :integer
  end
end
