ActiveAdmin.register Student do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params do
    permitted = [:permitted, :attributes, :first_name, :last_name, :middle_name, :record_book_number, :group_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end

end
