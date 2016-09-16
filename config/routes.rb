Rails.application.routes.draw do

  resources :parties
  patch '/parties/:party_id/new_playlist' => 'parties#new_playlist'
  get '/profile' => 'users#profile'

  # auth routes
  get '/auth/spotify/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
