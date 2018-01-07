class UsersController < ApplicationController

  
  def index
    user = User.all.order(:id => :asc)
    render json: user.as_json 
  end
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {status: "User successfully created!"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
  