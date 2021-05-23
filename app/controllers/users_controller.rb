class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.new(create_params)
    if user.save
      session[:user_id] = user.id
      head :ok
    else
      render json: user.errors, status: :bad_request
    end
  end

  private

  def create_params
    params.permit(:name, :email, :password)
  end
end