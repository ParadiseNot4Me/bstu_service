class Subject < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :practic_teacher, class_name: "Teacher"
  has_many :schedule_fields, dependent: :destroy
end
