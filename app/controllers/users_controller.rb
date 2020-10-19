class UsersController < ApplicationController

  # Find all users
  def index
    render json: User.all, status: 200
  end

  # Find user by id
  def show
    begin
      @user = User.find(params[:id])  

      render json: @user, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: {status: "user not found"}, status: 404
    end
  end

  # Create user
  def create
    @user = User.new(user_params) 

    if @user.save
      @password = Password.new(password: params[:password], is_active: params[:is_active], user_id: @user.id)
      if @password.save
        render json: {user: @user, password: @password}, status: 201
      else
        @user.destroy
        render json: {status: "creation failed"}, status: 422
      end
    else
      render json: @user.errors, status: 422
    end
  end

  # Update user
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: {status: "update successful"}, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

  # Delete user
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: {status: "delete successful"}, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

  private
  def user_params
    params.permit(:email, :cpr, :nemid, :gender_id)
  end

  def password_params
    params.permit(:password, :is_active)
  end
end
