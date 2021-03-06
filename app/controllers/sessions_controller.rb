class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_or_create_from_auth(auth)

    if user
      session[:user_id] = user.id
      redirect_to session[:previous_page]
    else
      flash[:messages] = "Unable to log in."
      redirect_to :back
    end
  end

  def destroy
    flash[:messages] = "You are logged out."
    session.clear
    redirect_to :back
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
