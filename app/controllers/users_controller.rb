class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def destroy
    if @user.destroy
      head :no_content
    else
      render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
