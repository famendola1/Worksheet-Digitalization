class Course < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'Admin'
end
