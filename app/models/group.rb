class Group < ActiveRecord::Base

  has_many :schedule_field_groups, dependent: :destroy
  has_many :schedule_fields, :through => :schedule_field_groups

  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :schedule_field_groups

end
