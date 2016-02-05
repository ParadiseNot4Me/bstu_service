class Role < ActiveRecord::Base
  has_many :users_roles, class_name: "UsersRoles"
  has_many :users, :through => :users_roles
end
