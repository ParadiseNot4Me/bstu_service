class UserSerializer < ActiveModel::Serializer
  attributes :login
  belongs_to :student
end
