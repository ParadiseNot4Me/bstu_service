class Api::V1::Base::BaseAdminController < Api::V1::Base::BaseAuthorizableController

  before_filter :is_admin!


  private

  def is_admin!
    if !(@user.roles.include? Role.find_by name: "admin")
      #Доступ запрешен
      rescue_access_denied("эти методы доступны только для администратора")
      #render nothing: true, status: "403"
    end
  end

end
