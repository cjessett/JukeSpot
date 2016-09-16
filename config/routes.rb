Rails.application.routes.draw do

  resources :parties

  get '/logout' => 'application#logout'

  get '/auth/spotify/callback' => 'users#spotify'
  get '/profile' => 'users#profile'

  root 'application#home'
end
