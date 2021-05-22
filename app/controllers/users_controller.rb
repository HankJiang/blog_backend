class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(create_params)
    session[:user_id] = @user.id
    head :ok
  end

  private

  def create_params
    params.permit(:name, :email, :password)
  end
end