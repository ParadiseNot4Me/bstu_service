ActiveAdmin.register LabWork do

permit_params do
    permitted = [:permitted, :subject_id, :n, :time ]
    permitted << :other if params[:action] == 'create'
    permitted
  end


end
