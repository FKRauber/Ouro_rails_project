class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome to Ouro!"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if user.update(user_params)
      redirect_to user_path(@user), notice: "User has been successfully updated!"
    else
      render :edit
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :admin)
  end
end
