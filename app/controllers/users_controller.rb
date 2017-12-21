class UsersController < ApplicationController
  def index
    user = User.all.order(:id => :asc)
    render json: user.as_json 
  end
  def create
    user = User.new(
      user_id: current_user.id,
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
      )
    if user.save
      render json: {status: "User successfully created!"}
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
  