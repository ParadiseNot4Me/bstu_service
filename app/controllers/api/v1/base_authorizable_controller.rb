class Api::V1::BaseAuthorizableController < ApplicationController

  before_filter :authenticate_user_from_token!


  def kek
    render(json:  @user)
  end

  private

  def authenticate_user_from_token!
    if !params['token']
      render nothing: true, status: :unauthorized
    else
      hash = Hashs.find_by token: params['token']
      if hash
        @user = hash.user
      else
        render nothing: true, status: :unauthorized
      end
    end
  end

end
