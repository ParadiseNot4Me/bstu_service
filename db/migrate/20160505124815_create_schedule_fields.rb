class CreateScheduleFields < ActiveRecord::Migration
  def change
    create_table :schedule_fields do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :lesson_time, index: true, foreign_key: true
      t.references :lesson_day, index: true, foreign_key: true
      t.references :lesson_week_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
