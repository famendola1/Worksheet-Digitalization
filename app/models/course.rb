class Course < ApplicationRecord
  has_many :courses_students
  has_many :students, through: :courses_students
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'Admin'
  #has_and_belongs_to_many :students
end
