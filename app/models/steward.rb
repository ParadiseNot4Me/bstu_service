class Steward < ActiveRecord::Base
  belongs_to :student
  belongs_to :group

  has_many :approves, class_name: "Approve"
  has_many :users, :through => :approves
end
