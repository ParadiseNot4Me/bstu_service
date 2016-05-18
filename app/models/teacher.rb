class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :subjects, dependent: :destroy
  has_many :practic_subjects, dependent: :destroy, class_name: "Subject", :foreign_key => 'practic_teacher_id'

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
