class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    #looks in database for user if not there create a new user
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, notice: "Sign in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end

end
