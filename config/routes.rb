Rails.application.routes.draw do

  resources :parties do
    get '/playlists/import/:id' => 'playlists#import'
  end

  get '/profile' => 'users#profile'

  # auth routes
  get '/auth/spotify/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
