ActiveAdmin.register Steward do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  permit_params do
    permitted = [:permitted, :attributes, :student_id, :group_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end


end
