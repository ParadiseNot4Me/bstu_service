class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :subjects, dependent: :destroy

  def name
    return last_name + " " + first_name + " " + middle_name;
  end
end
