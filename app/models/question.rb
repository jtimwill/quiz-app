class Question < ActiveRecord::Base
  has_many :quiz_questions
  has_many :quizzes, through: :quiz_questions
  has_many :user_answers

  validates :question, presence: true
  validates :answer, presence: true
end