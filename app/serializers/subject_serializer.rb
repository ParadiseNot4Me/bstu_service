class SubjectSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :teacher
end
