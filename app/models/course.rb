class Course < ApplicationRecord
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'Admin'
  has_and_belongs_to_many :students
end
