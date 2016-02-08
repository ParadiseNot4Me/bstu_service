class Api::V1::BaseAdminController < Api::V1::BaseAuthorizableController

  before_filter :is_admin!

  private

  def is_admin!
    if !(@user.roles.include? Role.find_by name: "admin")
    #Доступ запрешен
      render nothing: true, status: "403"
    end
  end

end
