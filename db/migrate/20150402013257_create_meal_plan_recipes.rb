class CreateMealPlanRecipes < ActiveRecord::Migration
  def change
    create_table :meal_plan_recipes do |t|
      t.integer :meal_plan_id, :recipe_id
    end
  end
end
