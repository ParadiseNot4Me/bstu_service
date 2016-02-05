class StudentSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :middle_name
end
