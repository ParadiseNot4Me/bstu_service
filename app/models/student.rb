class Student < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  has_many :stewards
  has_many :student_progresses

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
