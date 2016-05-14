class ScheduleField < ActiveRecord::Base
  belongs_to :subject
  belongs_to :lesson_time
  belongs_to :lesson_day
  belongs_to :lesson_week_type
  belongs_to :lesson_type


  has_many :schedule_field_groups
  has_many :groups, :through => :schedule_field_groups
  accepts_nested_attributes_for :schedule_field_groups
end
