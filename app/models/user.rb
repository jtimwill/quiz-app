class User < ActiveRecord::Base
  include Sluggable
  
  has_many :user_quizzes
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  def admin?
    self.roles.to_s == 'admin'
  end

  sluggable_column :username
end