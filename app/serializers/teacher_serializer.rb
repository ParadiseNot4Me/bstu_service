class TeacherSerializer < ActiveModel::Serializer
	attributes :name
	has_many :subjects
end
