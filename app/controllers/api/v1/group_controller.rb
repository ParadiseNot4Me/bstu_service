class Api::V1::GroupController < Api::V1::Base::BaseAdminController

  def index
  	render json: Group.all
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:first_name, :last_name, :middle_name, :record_book_number, :group_id)
  end
end
