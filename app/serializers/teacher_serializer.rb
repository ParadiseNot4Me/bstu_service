class TeacherSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :middle_name
	has_many :subjects
end
