class CreateLessonDays < ActiveRecord::Migration
  def change
    create_table :lesson_days do |t|
      t.integer :n
      t.string :name

      t.timestamps null: false
    end
  end
end
