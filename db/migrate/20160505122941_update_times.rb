class UpdateTimes < ActiveRecord::Migration
  def change
  	add_column :lesson_times, :n, :integer
  end
end
