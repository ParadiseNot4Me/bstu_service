class Api::V1::StudentController < Api::V1::BaseAdminController

  before_action :set_student, only: [:show ]

  def show
    render json: @student
  end

  def create
    student = Student.new(student_params)
    if Student.find_by record_book_number: student.record_book_number
      render(json: {:error => "Студент с указанным номером зачетки уже существует"})
    else
      student.save
      render json: {:status => "Студент успешно создан"}
    end
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:first_name, :last_name, :middle_name, :record_book_number, :group_id)
  end

end
