class Api::V1::Base::BaseAuthorizableController < ApplicationController
  include ExceptionHandlable
  before_filter :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    if !params['token']
      rescue_bad_request("token")
    else
      hash = Hashs.find_by token: params['token']
      if hash
        @user = hash.user
      else
       rescue_unauthorized("Ошибка токена")
      end
    end
  end

end
