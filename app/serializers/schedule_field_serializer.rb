class ScheduleFieldSerializer < ActiveModel::Serializer
  attributes  :id, :teacher, :subject, :lesson_week_type, :lesson_type, :cabinet
  belongs_to :lesson_day
  # belongs_to :lesson_week_type
  belongs_to :lesson_time
  #belongs_to :lesson_type

  has_many :groups, :through => :schedule_field_groups
  # belongs_to :subject

  def teacher
    if object.lesson_type.name == "Практика"
      object.subject.practic_teacher.name
    else
      object.subject.teacher.name
    end
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

  def cabinet
    if object.cabinet != nil
      object.cabinet.name
    else
      nil
    end
  end


end
