class CreateScheduleFieldGroups < ActiveRecord::Migration
  def change
    create_table :schedule_field_groups do |t|
      t.references :group, index: true, foreign_key: true
      t.references :schedule_field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
