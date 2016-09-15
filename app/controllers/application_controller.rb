class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home
    render 'home/index'
  end

  private

  def current_user
    if session[:spotify]
      @current_user ||= RSpotify::User.new(session[:spotify])
    end
  end
end
