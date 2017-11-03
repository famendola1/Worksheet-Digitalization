class Student < ApplicationRecord
  has_many :courses_students
  has_many :courses, through: :courses_students
  #has_and_belongs_to_many :courses
  has_many :quiz_results
  validates :student_id, uniqueness: { scope: :student_id}
end
