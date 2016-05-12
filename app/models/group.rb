class Group < ActiveRecord::Base

  has_many :schedule_field_groups
  has_many :schedule_fields, :through => :schedule_field_groups
  accepts_nested_attributes_for :schedule_field_groups

end
