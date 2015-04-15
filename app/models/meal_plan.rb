class MealPlan < ActiveRecord::Base
  include Sluggable

  MEALS = ["Breakfast", "Lunch", "Dinner", "Snack", "Post-workout", "Pre-workout",
          "Midnight Snack", "Binge", "Hangover cure"]

  belongs_to :user
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes

  validates :title, presence: :true

  sluggable_column :title
end