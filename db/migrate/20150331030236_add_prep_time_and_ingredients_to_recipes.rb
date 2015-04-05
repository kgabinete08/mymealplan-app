class AddPrepTimeAndIngredientsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :directions, :text
    add_column :recipes, :ingredients, :text
  end
end
