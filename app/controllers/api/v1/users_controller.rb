class Api::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @users = User.select(:id, :email, :name).all
    render json: @users
  end

  def show
    @user = User.select(:id, :email, :name).find(params[:id]) 
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { result: "success", user: @user}
    else
      render json: { result: "fail", errors: @user.errors}
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render json: { result: "success", user: @user }
    else
      render json: { result: "fail", errors: @user.errors }
    end
  end

  def destroy
    User.find(params[:id]).destroy

    render json: { result: "success" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end