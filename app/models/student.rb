class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results, :foreign_key => :result_id
end
