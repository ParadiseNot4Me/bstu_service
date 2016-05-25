class LabProgressStudentProgress < ActiveRecord::Base
	belongs_to :student_progress
	belongs_to :lab_progress
end
