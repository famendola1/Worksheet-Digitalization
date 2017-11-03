class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :quiz_results
  include StudentsHelper
  
  def self.to_csv
    # build attributes
    attributes = %w{student_id name category quiz_id quiz_timestamp quiz_category contributor collaborator communicator challenger }
    (1..18).each do |n|
      attributes.concat ["q#{n}a", "q#{n}b", "q#{n}c", "q#{n}d"]
    end
    
    # generate csv file
    CSV.generate(headers: true) do |csv|
      # add the attributes as headers
      csv << attributes
      
      all.each do |s|
        # relevant student attributes
        student = [s.id, s.name, s.category]
        s.quiz_results.each do |q|
          # relevant quiz_result attributes
          student.concat [q.id, q.created_at, s.get_category(q), q.contributor, q.collaborator, q.communicator, q.challenger]
          q.answers.order("question ASC").each do |a|
            # relevant answer attributes
            student.concat [a.responseA, a.responseB, a.responseC, a.responseD]
          end
          
          # add this student/quiz_result entry as a row in the csv
          csv << student
        end
      end
    end
  end
end
