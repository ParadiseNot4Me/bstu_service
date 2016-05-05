class UpdateTeacherStundents < ActiveRecord::Migration
  def change
    add_column :students, :user_id, :integer
    add_reference :students, :users, index: true, foreign_key: true

    add_column :teachers, :user_id, :integer
    add_reference :teachers, :users, index: true, foreign_key: true
  end
end
