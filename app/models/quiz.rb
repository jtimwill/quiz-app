class Quiz < ActiveRecord::Base
  include Sluggable

  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  has_many :user_quizzes

  validates :category, presence: true, uniqueness: true

  sluggable_column :category
end