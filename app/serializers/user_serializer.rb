class UserSerializer < ActiveModel::Serializer
  attributes :id, :login
  belongs_to :student
  belongs_to :teacher
end
