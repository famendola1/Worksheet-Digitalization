class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  include StudentsHelper
  
  def self.to_csv
    # build attributes
    attributes = %w{student_id name quiz_id quiz_timestamp category}
    (1..18).each do |n|
      attributes << "q#{n}a"
      attributes << "q#{n}b"
      attributes << "q#{n}c"
      attributes << "q#{n}d"
    end
    
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |s|
        student = [s.id, s.name]
        s.quiz_results.each do |q|
          student << q.id
          student << q.created_at
          student << s.get_category(q)
          q.answers.order("question ASC").each do |a|
            student << a.responseA
            student << a.responseB
            student << a.responseC
            student << a.responseD
          end
          csv << student
        end
      end
    end
  end
end
