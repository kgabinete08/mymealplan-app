class AddInfoToMealPlan < ActiveRecord::Migration
  def change
    add_column :meal_plans, :day, :string
    add_column :meal_plans, :meal, :string
  end
end
