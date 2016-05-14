class StudentProgress < ActiveRecord::Base
  belongs_to :schedule_field
  
  belongs_to :student
end
