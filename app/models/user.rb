class User < ActiveRecord::Base
  include Sluggable

  has_many :recipes
  has_many :comments
  has_many :meal_plans
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end
end