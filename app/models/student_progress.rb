class StudentProgress < ActiveRecord::Base
  belongs_to :schedule_field
  belongs_to :student

  has_many :lab_progress_student_progress
  has_many :lab_progresses, :through => :lab_progress_student_progress
end
