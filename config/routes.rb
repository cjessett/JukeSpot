Rails.application.routes.draw do

  resources :parties
  patch '/parties/:id/new_playlist' => 'parties#new_playlist'
  patch '/parties/:id/import' => 'parties#import'

  get '/profile' => 'users#profile'

  get '/juke_tracks/:id/vote_up' => 'votes#up'
  get '/juke_tracks/:id/vote_down' => 'votes#down'

  # auth routes
  get '/auth/spotify/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
