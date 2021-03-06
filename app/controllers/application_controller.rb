class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    head :unauthorized unless logged_in?
  end
end
