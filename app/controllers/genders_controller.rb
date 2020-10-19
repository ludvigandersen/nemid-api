class GendersController < ApplicationController

  # Find all
  def index
    render json: Gender.all, status: 200
  end

  # Find one by id
  def show
    begin
      @gender = Gender.find(params[:id])  

      render json: @gender, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: {status: "gender not found"}, status: 404
    end
  end

  # Create gender
  def create
    @gender = Gender.new(gender_params)

    if @gender.save
      render json: @gender, status: 201
    else
      render json: @gender.errors, status: 422
    end
  end

  # Update gender
  def update
    @gender = Gender.find(params[:id])

    if @gender.update(gender_params)
      render json: {status: "update successful"}, status: 200
    else
      render json: @gender.errors, status: 422
    end
  end

  # Delete gender
  def destroy
    @gender = Gender.find(params[:id])

    if @gender.destroy
      render json: {status: "delete successful"}, status: 200
    else
      render json: @gender.errors, status: 422
    end
  end

  private
  def gender_params
    params.permit(:label)
  end
end
