class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.references :admin_id
      t.string :name
      t.string :semester

      t.timestamps
    end
    add_index :courses, :admin_id
  end
end
