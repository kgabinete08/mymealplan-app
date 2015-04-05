class User < ActiveRecord::Base

  has_many :recipes
  has_many :meal_plans

  has_secure_password validations: false

  validates :username, presence: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
end