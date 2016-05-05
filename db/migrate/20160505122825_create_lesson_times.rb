class CreateLessonTimes < ActiveRecord::Migration
  def change
    create_table :lesson_times do |t|
      t.time :start
      t.time :end

      t.timestamps null: false
    end
  end
end
