class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # READ: Show all users
  # def index
  #   @users = User.all
  # end
  def index
    if params[:job_role].present?
      @users = User.where(job_role: params[:job_role])
    else
      @users = User.all.order(:last_name)
    end
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
      render :new, status: :unprocessable_entity
    end
  end

  # UPDATE: Edit form
  def edit
  end

  # UPDATE: Save updates
  # def update
  #   if @user.update(user_params)
  #     redirect_to @user, notice: "User successfully updated!"
  #   else
  #     render :edit
  #   end
  # end
  def update
    if @user.update(user_params)
      puts "Update successful: #{@user.inspect}" # Debugging line
      respond_to do |format|
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
        format.turbo_stream
      end
    else
      puts "Update failed: #{@user.errors.full_messages}" # Debugging line
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.turbo_stream
      end
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

  # def user_params
  #   params.require(:user).permit(:username, :email, :first_name, :last_name, :date_of_birth, :job_role)
  # end
  def user_params
    if action_name == "create"
      params.require(:user).permit(:first_name, :last_name, :email, :username, :date_of_birth, :job_role)
    else
      params.require(:user).permit(:first_name, :last_name, :email, :username)
    end
  end 
end
