class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: false do |t|
      t.primary_key :student_id
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
