class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Your account has been created."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update

    if @user.update(user_params)
      flash[:success] = "Your account has been updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def set_user
    @user = User.find_by slug: params[:id]
  end

  def require_correct_user
    if @user != current_user
      flash[:alert] = "You do not have the permission to do that."
      redirect_to root_path
    end unless current_user.admin?
  end
end