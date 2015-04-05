class Recipe < ActiveRecord::Base
  has_many :meal_plan_recipes
  has_many :meal_plans, through: :meal_plan_recipes

  validates :title, presence: :true, uniqueness: :true, length: {minimum: 5}
  validates :description, presence: :true
  validates :ingredients, presence: :true
  validates :directions, presence: :true
end