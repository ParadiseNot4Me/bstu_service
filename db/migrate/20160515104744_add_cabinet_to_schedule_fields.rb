class AddCabinetToScheduleFields < ActiveRecord::Migration
  def change
  	add_reference :schedule_fields, :cabinet, index: true, foreign_key: true
  end
end
