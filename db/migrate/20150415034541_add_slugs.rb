class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :recipes, :slug, :string
    add_column :meal_plans, :slug, :string
  end
end
