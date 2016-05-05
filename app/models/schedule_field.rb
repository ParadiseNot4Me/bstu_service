class ScheduleField < ActiveRecord::Base
  belongs_to :subject
  belongs_to :lesson_time
  belongs_to :lesson_day
  belongs_to :lesson_week_type
end
