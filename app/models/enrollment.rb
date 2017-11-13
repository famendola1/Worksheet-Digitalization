class Enrollment < ApplicationRecord
	belongs_to :course
	belongs_to :student
	validates :student_id, presence: true
	validates :course_id, presence: true
	validates_uniqueness_of :student, scope: [:student_id, :course_id]
end