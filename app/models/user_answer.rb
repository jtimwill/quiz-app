class UserAnswer < ActiveRecord::Base
  belongs_to :user_quiz
  belongs_to :question
end