class MealPlansController < ApplicationController

  def index
    @meal_plans = MealPlan.all
  end

  def new
    @meal_plan = MealPlan.new
    @recipes = Recipe.all
  end

  def create
    @meal_plan = MealPlan.new(meal_plan_params)

    if @meal_plan.save
      flash[:success] = "Your meal_plan has been created."
      redirect_to meal_plan_path(@meal_plan)
    else
      render :new
    end
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

  def edit
    @meal_plan = MealPlan.find(params[:id])
  end

  def update
    @meal_plan = MealPlan.find(params[:id])

    if @meal_plan.update(meal_plan_params)
      flash[:success] = "Meal plan has been updated."
      redirect_to meal_plan_path(@meal_plan)
    else
      render :edit
    end
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(:title, :description, recipe_ids: [])
  end
end