class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :user_quiz_id
      t.integer :question_id
      t.string :answer
      t.timestamps
    end
  end
end
