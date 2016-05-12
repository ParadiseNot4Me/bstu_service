class ScheduleFieldSerializer < ActiveModel::Serializer
  attributes  :teacher, :subject, :lesson_week_type
  belongs_to :lesson_day
 # belongs_to :lesson_week_type
  belongs_to :lesson_time
 # belongs_to :subject

  def teacher
  	object.subject.teacher.name
  end

  def subject
  	object.subject.name
  end

  def lesson_week_type
  	object.lesson_week_type.name	
  end


end
