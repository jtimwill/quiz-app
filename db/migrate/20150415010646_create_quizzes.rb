class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :category
      t.integer :length
      t.timestamps
    end
  end
end
