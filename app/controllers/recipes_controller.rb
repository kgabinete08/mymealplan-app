class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  before_action :require_correct_user, only: [:edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = "Your recipe has been added."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "The recipe was updated"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(recipe: @recipe, user: current_user, vote: params[:vote])

    respond_to do |format|
      if @vote.valid?
        format.js
        format.html { redirect_to :back, success: "Your vote was added." }
      else
        format.js
        format.html { redirect_to :back, alert: "You can only vote once."}
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :prep_time, :ingredients, :directions)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def require_correct_user
    if @recipe.user != current_user
      flash[:alert] = "You do not have the permission to do that."
      redirect_to root_path
    end unless current_user.admin?
  end
end