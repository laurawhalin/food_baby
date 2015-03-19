Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  root 'welcome#index'

  get '/logout' => 'sessions#destroy'

  resources :restaurants, only: [:index, :show, :create]
  # get '/restaurants/:id', to: 'restaurants#show'

  resources :users, only: [:show, :destroy]
end
