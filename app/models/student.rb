class Student < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :quiz_results
  validates :student_id, uniqueness: { scope: :student_id}
end
