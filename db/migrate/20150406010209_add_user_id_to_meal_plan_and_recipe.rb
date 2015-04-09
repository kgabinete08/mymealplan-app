class AddUserIdToMealPlanAndRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :user_id, :integer
    add_column :meal_plans, :user_id, :integer
  end
end
