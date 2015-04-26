class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.integer :quiz_id
      t.integer :question_id
    end
  end
end