class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :spotify_user

  def home
    render 'home/index'
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def spotify_user
    @spotify_user ||= RSpotify::User.new(session[:spotify]) if session[:spotify]
  end
end
