class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  include StudentsHelper
  
  def self.to_csv
    # build attributes
    attributes = %w{student_id name category quiz_id quiz_timestamp quiz_category}
    (1..18).each do |n|
      attributes << "q#{n}a"
      attributes << "q#{n}b"
      attributes << "q#{n}c"
      attributes << "q#{n}d"
    end
    
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |s|
        student = [s.id, s.name, s.category]
        s.quiz_results.each do |q|
          student.concat [q.id, q.created_at, s.get_category(q)]
          q.answers.order("question ASC").each do |a|
            student.concat [a.responseA, a.responseB, a.responseC, a.responseD]
          end
          csv << student
        end
      end
    end
  end
end
