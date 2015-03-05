class SessionsController < ApplicationController

  def new
    redirect_to user_path
  end

  def create
    user = User.find_or_create_from_auth(auth)

    if user
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:messages] = "Unable to log in."
      redirect_to :back
    end
  end

  def destroy
    flash[:messages] = "You are logged out."
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
