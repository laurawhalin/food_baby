Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  root 'welcome#index'

  get '/logout' => 'sessions#destroy'

  resources :restaurants, only: [:index, :show, :create]

  resources :users, only: [:show, :destroy]

  # get '/current_location', to: 'locations#update', as: 'fetch_current_location'
end
