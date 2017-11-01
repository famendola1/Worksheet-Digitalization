class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  
  def self.to_csv
   # attributes = %w{student_id name quiz_id question responseA responseB responseC responseD}
    CSV.generate(headers: false) do |csv|
      # csv << attributes
      all.each do |s|
        student = [s.id, s.name]
        s.quiz_results.each do |q|
          student << q.id
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
