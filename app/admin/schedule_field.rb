ActiveAdmin.register ScheduleField do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "ScheduleField" do
      f.input :subject
      f.input :lesson_time
      f.input :lesson_day
      f.input :lesson_week_type
       f.input :lesson_type
      f.input :groups, :as => :check_boxes
    end
    f.actions
  end

  permit_params :permitted, :attributes, :subject_id, :lesson_day_id, :lesson_time_id,
   :lesson_type_id,
    :lesson_week_type_id, group_ids:[]

  show do |scheduleField|

    attributes_table do
      row :subject
      row :lesson_time
      row :lesson_day
      row :lesson_week_type
      row :lesson_type
      str = ""
      scheduleField.groups.each do |group|
        str += group.name + ", "
      end


      row :groups do str
      end


    end

  end

end
