class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  
  def to_param
    "#{student_id}"
  end
end
