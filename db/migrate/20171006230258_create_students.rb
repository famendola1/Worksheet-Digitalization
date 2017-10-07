class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :student_id
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
