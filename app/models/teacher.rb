class Teacher < ActiveRecord::Base
  belongs_to :user

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
