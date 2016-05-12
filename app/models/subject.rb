class Subject < ActiveRecord::Base
  belongs_to :teacher
  has_many :schedule_fields
end
