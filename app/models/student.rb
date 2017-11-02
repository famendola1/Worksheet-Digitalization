class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  validates :student_id, uniqueness: { scope: :student_id}
end
