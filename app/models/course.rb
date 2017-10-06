class Course < ApplicationRecord
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'Admin'
end
