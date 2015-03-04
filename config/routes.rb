Rails.application.routes.draw do

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :restaurants, only: [:index, :show]
  get 'restaurants/1' => 'restuarants#show'

  # resources :users
  get 'users/1' => 'users#show'
end
