class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    session[:spotify] = env['omniauth.auth']
    user = User.find_or_create_by(spotify_id: spotify_user.id)
    user.update(session_params)
    session[:user_id] = user.id
    redirect_to '/profile'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def session_params
    spotify_user.credentials.select{ |key,val| ["token", "refresh_token"].include? key }
  end
end
