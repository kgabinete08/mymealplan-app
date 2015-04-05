class MealPlan < ActiveRecord::Base
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes

  validates :title, presence: :true
end