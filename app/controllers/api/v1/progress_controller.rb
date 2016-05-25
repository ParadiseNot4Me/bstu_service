class Api::V1::ProgressController < Api::V1::Base::BaseAuthorizableController

  def show
    schedule_field_id = params[:schedule_field_id]
    group_id = params[:group_id]
    date = params[:date].to_datetime

    students_in_group = Student.where(group_id: group_id)

    schedule_field = ScheduleField.find(schedule_field_id)
    subject = Subject.find(schedule_field.subject_id)

    if(schedule_field.lesson_day.n != date.wday)
      rescue_not_found_custom("Занятие с указанными данными не нийдено")
      return
    end

    students_in_group = students_in_group.sort { |a, b|  a.name <=> b.name }


    lab_works = LabWork.where(subject_id: subject.id)


    progresses = Array.new
    students_in_group.each do |student|
      progress = StudentProgress.find_by(date: date,
                                         student_id: student.id,
                                         schedule_field_id: schedule_field_id)

      if(progress == nil)
        progress = StudentProgress.new(date: date,
                                       student_id: student.id,
                                       schedule_field_id: schedule_field_id,
                                       group_id: group_id)
        progress.save
      end

      if(lab_works!=nil)
        lab_work_progresses = Array.new()

        lab_works.each do |lab_work|
          lab_progress = LabProgress.find_by(lab_work_id: lab_work.id,
                                             student_id: student.id,
                                             subject_id: subject.id)

          logger.info(lab_progress)
          if (lab_progress == nil)
            lab_progress = LabProgress.new(lab_work_id: lab_work.id,
                                           student_id: student.id,
                                           subject_id: subject.id)
            lab_progress.save

            progress.lab_progresses << lab_progress
          end

          lab_work_progresses  << lab_progress

        end
        
        progress.lab_progresses = lab_work_progresses
      end

      progresses << progress
    end




    render json: progresses
  end

  def update
    schedule_field_id = params[:schedule_field_id]
    group_id = params[:group_id]
    date = params[:date].to_datetime

    schedule_field = ScheduleField.find(schedule_field_id)
    subject = Subject.find(schedule_field.subject_id)

    params[:data].each do | updateable_field |

      student_id = updateable_field[:id]
      field = StudentProgress.find(student_id)
      field.attendance = updateable_field[:attendance]

      updateable_labwork = updateable_field[:lab_progresses]

      if( updateable_labwork != nil)

        updateable_labwork.each do | lab_work_field |
          lab = LabProgress.find(lab_work_field[:id])

          lab.mark = lab_work_field[:mark]

          lab.save

        end
      end

      field.save
    end

    render json: { status: "Данные успешно обновлены" }
  end


end
