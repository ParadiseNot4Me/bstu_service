class Student < ActiveRecord::Base
  belongs_to :group
  belongs_to :user, dependent: :destroy
  
  has_many :stewards, dependent: :destroy
  has_many :student_progresses, dependent: :destroy

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
