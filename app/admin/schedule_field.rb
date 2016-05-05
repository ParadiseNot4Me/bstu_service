ActiveAdmin.register ScheduleField do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params do
    permitted = [:permitted, :attributes, :subject_id, :lesson_time_id, :lesson_week_type_id, :lesson_day_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end



end
