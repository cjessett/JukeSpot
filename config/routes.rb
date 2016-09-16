Rails.application.routes.draw do

  resources :parties

  get '/profile' => 'users#profile'

  # auth routes
  get '/auth/spotify/callback' => 'users#spotify'

  get '/logout' => 'application#logout'

  root 'application#home'
end
