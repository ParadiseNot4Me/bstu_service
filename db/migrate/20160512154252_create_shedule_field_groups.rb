class CreateSheduleFieldGroups < ActiveRecord::Migration
  def change
    create_table :shedule_field_groups do |t|
      t.references :group, index: true, foreign_key: true
      t.references :schedule_fields, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
