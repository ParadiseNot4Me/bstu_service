class CreateLessonWeekTypes < ActiveRecord::Migration
  def change
    create_table :lesson_week_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
