class Department < ApplicationRecord
	has_many :subdepartments, :class_name => "Department", foreign_key: :subdepartment_id
  	belongs_to :department, :class_name => "Department", foreign_key: :id, optional: true 
end
