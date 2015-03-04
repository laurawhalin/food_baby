class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(sessions[:user_id]) if sessions[:user_id]
  end

  def authorize!
    redirect_to :back, flash[:alert] = "Not authorized" if current_user.nil?
  end
end
