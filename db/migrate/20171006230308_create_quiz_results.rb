class CreateQuizResults < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_results do |t|

      t.timestamps
    end
  end
end
