class Student < ActiveRecord::Base
  belongs_to :group
  
  has_many :stewards

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
