class StudentProgressSerializer < ActiveModel::Serializer
  attributes :id, :attendance 
  belongs_to :student
  has_many :lab_progresses
   
end
