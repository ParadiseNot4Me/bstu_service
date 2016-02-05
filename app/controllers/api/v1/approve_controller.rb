class Api::V1::ApproveController < Api::V1::BaseAuthorizableController

  before_filter :authenticate_steward!

  def index
    render json: @steward.users
  end


  private

  def authenticate_steward!
  	@steward = @user.student.stewards[0]
    if !@steward
      render nothing: true, status: :unauthorized
    end
  end

end
