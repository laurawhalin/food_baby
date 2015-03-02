Rails.application.routes.draw do

  root 'welcome#index'
  resources :restaurants, only: [:index, :show]
  get 'restaurants/1' => 'restuarants#show'
end
