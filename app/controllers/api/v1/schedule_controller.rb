class Api::V1::ScheduleController < Api::V1::Base::BaseAuthorizableController

  def schedule
    group = @user.student.group
    render json: group.schedule_fields
  end

  def schedule_of_day
    group = @user.student.group
    time = params[:date].to_datetime

    fields = group.schedule_fields.select { |x| x.lesson_day.n == time.wday}

    render json: fields 
  end
end
