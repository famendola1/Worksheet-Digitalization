class QuizResult < ApplicationRecord
  belongs_to :student, :foreign_key => :student_id, class_name: 'Student'
end
