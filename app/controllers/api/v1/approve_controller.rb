class Api::V1::ApproveController < Api::V1::Base::BaseAuthorizableController

  before_filter :authenticate_steward!

  def index
    render json: @steward.users
  end

  def approve
    requestedUser = User.find(params[:user_id])
    if @steward.users.include?requestedUser
      userRole =  Role.find_by name: "user"
      requestedUser.roles << userRole
      render json: { status: "Регистрация пользователя подтверждена успешно" }
    else
      render(json: {:error => "Староста может подтверждать студентов только своей группы"})
    end

  end


  private

  def authenticate_steward!
    @steward = @user.student.stewards[0]
    if !@steward
      render nothing: true, status: :unauthorized
    end
  end

end
