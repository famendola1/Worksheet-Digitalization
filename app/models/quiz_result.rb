class QuizResult < ApplicationRecord
  belongs_to :student
  has_many :answers
end
