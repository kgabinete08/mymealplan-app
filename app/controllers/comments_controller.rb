class CommentsController < ApplicationController
  before_action :require_user, :set_recipe

  def create
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Your comment was created."
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Comment field cannot be blank."
      redirect_to :back
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end