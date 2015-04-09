class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: [:show, :edit, :update]
  before_action :require_user

  def index
    @meal_plans = MealPlan.all
  end

  def new
    @meal_plan = MealPlan.new
    @recipes = Recipe.all
  end

  def create
    binding.pry
    @meal_plan = MealPlan.new(meal_plan_params)
    @meal_plan.user = current_user

    if @meal_plan.save
      flash[:success] = "Your meal_plan has been created."
      redirect_to meal_plan_path(@meal_plan)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update

    if @meal_plan.update(meal_plan_params)
      flash[:success] = "Meal plan has been updated."
      redirect_to meal_plan_path(@meal_plan)
    else
      render :edit
    end
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(:title, :description, :day, :meal, recipe_ids: [])
  end

  def set_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end
end