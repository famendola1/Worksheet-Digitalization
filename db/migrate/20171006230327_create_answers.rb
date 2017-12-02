class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :answer_id
      t.references :quiz_result
      t.integer :question
      t.integer :responseA
      t.integer :responseB
      t.integer :responseC
      t.integer :responseD
      # t.integer :category

      t.timestamps
    end
  end
end
