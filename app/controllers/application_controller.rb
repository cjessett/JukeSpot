class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :spotify_user
  before_action :require_login, except: [:home]

  def home
    if current_user
      redirect_to '/profile'
    else
      render 'home/index'
    end
  end

  private
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def spotify_user
    @spotify_user ||= RSpotify::User.new session[:spotify] if session[:spotify]
  end

  def require_login
    unless current_user
      flash[:error] = "You  must be logged in to access this section"
      redirect_to '/'
    end
  end
end
