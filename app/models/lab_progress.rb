class LabProgress < ActiveRecord::Base

  belongs_to :lab_work
  has_many :lab_progress_student_progress
  has_many :student_progresses, :through => :lab_progress_student_progress
end
