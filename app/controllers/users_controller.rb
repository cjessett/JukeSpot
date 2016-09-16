class UsersController < ApplicationController
  def spotify
    session[:spotify] = env['omniauth.auth']
    user = User.find_or_create_by(spotify_id: spotify_user.id)
    user.update(creds(user))
    session[:user_id] = user.id
    redirect_to '/profile'
  end

  def profile
    render 'profile'
  end

  def creds(user)
    spotify_user.credentials.select{ |k,v| ["token", "refresh_token"].include? k }
  end
end
