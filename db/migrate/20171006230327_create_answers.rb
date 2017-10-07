class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :answer_id
      t.references :quiz_result
      t.integer :question
      t.integer :response, :array => true
      t.integer :category, :array => true

      t.timestamps
    end
  end
end
