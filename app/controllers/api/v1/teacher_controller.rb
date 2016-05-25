class Api::V1::TeacherController < Api::V1::Base::BaseAuthorizableController

  def subjects
    if(@user.teacher_id == nil)
      subjects = Subject.where(teacher_id: @user.teacher.id)
      render json: subjects
    else
      rescue_access_denied("Данный запрос доступен только учителям")
    end
  end
end
