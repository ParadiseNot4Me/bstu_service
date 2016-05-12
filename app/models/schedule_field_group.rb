class ScheduleFieldGroup < ActiveRecord::Base
	belongs_to :schedule_field
	belongs_to :group
end
