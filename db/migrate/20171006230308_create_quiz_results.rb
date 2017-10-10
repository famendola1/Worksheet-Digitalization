class CreateQuizResults < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_results do |t|
      t.integer :result_id
      t.references :student
      t.string :reflection

      t.timestamps
    end
  end
end
