Rails.application.routes.draw do

  get '/' => 'application#home'

  get '/auth/spotify/callback' => 'users#spotify'
end
