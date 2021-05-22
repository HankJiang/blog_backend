class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: @user, status: :ok
    else
      head :not_found
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    head :ok
  end
end