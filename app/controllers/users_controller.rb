class UsersController < ApplicationController

  def profile
    @parties = current_user.parties
    render 'profile'
  end
end
