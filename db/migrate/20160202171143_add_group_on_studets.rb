class AddGroupOnStudets < ActiveRecord::Migration
  def change
  	add_reference :students, :groups, index: true, foreign_key: true
  end
end