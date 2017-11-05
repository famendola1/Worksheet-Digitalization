#class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.1]
#  def change
#    create_join_table :courses, :students do |t|
#      t.index [:course_id, :student_id]
      # t.index [:student_id, :course_id]
#    end
#  end
#end


class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.belongs_to :course, index: true
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end