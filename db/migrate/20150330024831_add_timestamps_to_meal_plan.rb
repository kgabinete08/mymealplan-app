class AddTimestampsToMealPlan < ActiveRecord::Migration
  def change
    add_column :meal_plans, :created_at, :datetime
    add_column :meal_plans, :updated_at, :datetime
  end
end
