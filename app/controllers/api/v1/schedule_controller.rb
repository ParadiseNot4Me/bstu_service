class Api::V1::ScheduleController < Api::V1::Base::BaseAuthorizableController

  def schedule
    if( @user.student != nil)
      group = @user.student.group
      render json: group.schedule_fields
    else

      subjects = @user.teacher.subjects

      lection_type = LessonType.find_by(name: "Лекция")

      schedule_fields = nil
      subjects.each do |subject|
        if( schedule_fields == nil)
          schedule_fields = subject.schedule_fields.where(lesson_type_id: lection_type.id)
        else
          schedule_fields << subject.schedule_fields.where(lesson_type_id: lection_type.id)
        end
      end

      lection_type = LessonType.find_by(name: "Практика")

      subjects = @user.teacher.practic_subjects

      subjects.each do |subject|
        if( schedule_fields == nil)
          schedule_fields = subject.schedule_fields.where(lesson_type_id: lection_type.id)
        else
          schedule_fields << subject.schedule_fields.where(lesson_type_id: lection_type.id)
        end
      end

      render json: schedule_fields
    end
  end

  def schedule_of_day
    if( @user.student != nil)
      group = @user.student.group
      time = params[:date].to_datetime
      fields = group.schedule_fields.select { |x| x.lesson_day.n == time.wday}
      render json: fields
    else

      subjects = @user.teacher.subjects


      lection_type = LessonType.find(name: "Лекция")


      schedule_fields = nil
      subjects.each do |subject|
        if( schedule_fields == nil)
          schedule_fields = subject.schedule_fields.where(lesson_type_id: lection_type.id)
        else
          schedule_fields << subject.schedule_fields.where(lesson_type_id: lection_type.id)
        end
      end

      lection_type = LessonType.find_by(name: "Практика")

      subjects = @user.teacher.practic_subjects

      subjects.each do |subject|
        if( schedule_fields == nil)
          schedule_fields = subject.schedule_fields.where(lesson_type_id: lection_type.id)
        else
          schedule_fields << subject.schedule_fields.where(lesson_type_id: lection_type.id)
        end
      end

      time = params[:date].to_datetime
      fields = schedule_fields.select { |x| x.lesson_day.n == time.wday}
      render json: fields
    end
  end
end
