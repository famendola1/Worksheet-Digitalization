class Student < ApplicationRecord

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :quiz_results
  validates :student_id, uniqueness: { scope: :student_id}

  require 'csv'
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
  
  def self.import(file, course)
    CSV.foreach(file.path, headers: false) do |row|
      student_id, name = row
      Student.create(student_id: student_id, name: name)
      if course.enrollments.find_by(student_id: student_id).nil?
        course.enrollments.create(student_id: student_id)
      end
    end
  end
end
