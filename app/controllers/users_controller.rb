class UsersController < ApplicationController
  def spotify
    session[:spotify] = env['omniauth.auth']
    redirect_to '/profile'
  end

  def profile
    if current_user
      render 'profile'
    end
  end
end
