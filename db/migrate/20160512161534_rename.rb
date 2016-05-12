class Rename < ActiveRecord::Migration
  def change
  	  rename_table :shedule_field_groups, :schedule_field_groups
  end
end
