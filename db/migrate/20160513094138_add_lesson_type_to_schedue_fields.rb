class AddLessonTypeToSchedueFields < ActiveRecord::Migration
  def change
  	add_reference :schedule_fields, :lesson_type, index: true, foreign_key: true
  end
end
