class SessionsController < ApplicationController

  def index
    
  end

  def create
    auth = env["omniauth.auth"]
    # raise env["omniauth.auth"].to_yaml
    session[:facebook] = { uid: auth.uid, oauth_token: auth.credentials.token, email: auth.info.email }
    redirect_to root_url
  end
end