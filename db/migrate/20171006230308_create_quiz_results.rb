class CreateQuizResults < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_results do |t|
      t.integer :result_id
      t.references :student
      t.string :reflection
      t.integer :collaborator
      t.integer :challenger
      t.integer :communicator
      t.integer :contributor

      t.timestamps
    end
  end
end
