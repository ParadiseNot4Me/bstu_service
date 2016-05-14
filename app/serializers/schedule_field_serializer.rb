class ScheduleFieldSerializer < ActiveModel::Serializer
  attributes  :id, :teacher, :subject, :lesson_week_type, :lesson_type
  belongs_to :lesson_day
  # belongs_to :lesson_week_type
  belongs_to :lesson_time
  #belongs_to :lesson_type

  has_many :groups, :through => :schedule_field_groups
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

  def lesson_type
    object.lesson_type.name
  end


end
