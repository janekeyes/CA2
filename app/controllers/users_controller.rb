class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # READ: Show all users
  def index
    @users = User.all
  end

  # READ: Show a single user
  def show
  end

  # CREATE: New user form
  def new
    @user = User.new
  end

  # CREATE: Save new user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User successfully created!"
    else
      render :new
    end
  end

  # UPDATE: Edit form
  def edit
  end

  # UPDATE: Save updates
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User successfully updated!"
    else
      render :edit
    end
  end

  # DELETE: Remove user
  def destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
