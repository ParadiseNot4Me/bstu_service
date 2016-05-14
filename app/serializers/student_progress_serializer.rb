class StudentProgressSerializer < ActiveModel::Serializer
  attributes :id, :mark, :attendance, :intime
  belongs_to :student
end
