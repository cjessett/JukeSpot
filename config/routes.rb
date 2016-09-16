Rails.application.routes.draw do

  resources :parties

  get '/profile' => 'users#profile'

  # auth routes
get '/auth/spotify/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
