class UserQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  has_many :user_answers
  accepts_nested_attributes_for :user_answers
end