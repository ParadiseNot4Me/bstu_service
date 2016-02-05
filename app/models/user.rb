class User < ActiveRecord::Base
  has_many :hashs, dependent: :destroy
  belongs_to :student

  has_many :users_roles, class_name: "UsersRoles"
  has_many :roles, :through => :users_roles

  has_many :approves, class_name: "Approve"
  has_many :stewards, :through => :approves

  before_create :hash_password

  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end


end
