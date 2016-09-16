Rails.application.routes.draw do

  resources :parties do 
    get '/new_playlist' => 'playlists#new'
  end
  get '/profile' => 'users#profile'
  

  # auth routes
  get '/auth/spotify/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
