class User < ActiveRecord::Base
  has_many :hashs, dependent: :destroy, class_name: "Hashs"
  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy

  has_many :users_roles, class_name: "UsersRoles", dependent: :destroy
  has_many :roles, :through => :users_roles

  has_many :approves, class_name: "Approve", dependent: :destroy
  has_many :stewards, :through => :approves

  before_create :hash_password

  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end


end
